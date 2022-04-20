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
end
