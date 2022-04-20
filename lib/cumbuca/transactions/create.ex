defmodule Cumbuca.Transactions.Create do
  alias Cumbuca.{Repo, Account, Transaction}

  def call(params) do
    amount = Decimal.from_float(params["amount"])
    with origin_account = %Account{} <- Repo.get(Account, params["origin_account_id"]),
         destination_account = %Account{} <- Repo.get(Account, params["destination_account_id"]),
         r when r in [:gt, :eq] <- Decimal.compare(origin_account.balance, amount) do

      withdraw =
        Ecto.Changeset.change(origin_account,
          balance: Decimal.sub(origin_account.balance, amount)
        )

      include =
        Ecto.Changeset.change(destination_account,
          balance: Decimal.add(destination_account.balance, amount)
        )

      result = Repo.transaction(fn ->
        Repo.update!(withdraw)
        Repo.update!(include)

        params
        |> Transaction.changeset()
        |> Repo.insert!()
      end)

      handle_transaction(result)
    else
      nil ->
        {:error, %{result: "Account not found.", status: :bad_request}}
      :lt -> {:error, %{result: "Isuficient balance.", status: :bad_request}}
    end
  end

  defp handle_transaction({:ok, %Transaction{}} = result), do: result
  defp handle_transaction({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
