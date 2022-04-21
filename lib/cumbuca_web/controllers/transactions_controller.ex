defmodule CumbucaWeb.TransactionsController do
  use CumbucaWeb, :controller

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, transaction} <- Cumbuca.create_transaction(params) do
      conn
      |> put_status(:created)
      |> render("transaction.json", transaction: transaction)
    end
  end

  def list(conn, params) do
    params = Map.put(params, "user_id", conn.assigns.user_id)

    with transactions when is_list(transactions) <- Cumbuca.list_transactions(params) do
      conn
      |> put_status(:created)
      |> render("create.json", transactions: transactions)
    end
  end
end
