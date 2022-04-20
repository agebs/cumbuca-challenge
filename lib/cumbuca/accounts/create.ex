defmodule Cumbuca.Accounts.Create do
  alias Cumbuca.{Repo, Account}

  def call(params) do
    params
    |> Map.put("balance", params["initial_balance"])
    |> Account.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Account{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
