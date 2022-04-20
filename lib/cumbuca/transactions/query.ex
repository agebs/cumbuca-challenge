defmodule Cumbuca.Transactions.Query do
  import Ecto.Query
  alias Cumbuca.{Repo, Transaction, Account}

  def call(params) do
    with {:ok, initial_date} <- Date.from_iso8601(params["initial_date"]),
         {:ok, final_date} <- Date.from_iso8601(params["final_date"]) do
      user_id = params["user_id"]

      query =
        from t in Transaction,
          where: fragment("? between ? and ?", t.processing_date, ^initial_date, ^final_date),
          inner_join: a in Account,
          on: t.origin_account_id == a.id and a.user_id == ^user_id,
          order_by: [asc: t.processing_date]

      Repo.all(query)
    else
      {:error, _} ->
        {:error, %{result: "Date: invalid format.", status: :bad_request}}
    end
  end
end
