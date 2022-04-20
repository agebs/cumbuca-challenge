defmodule CumbucaWeb.TransactionsController do
  use CumbucaWeb, :controller

  alias Cumbuca.Transactions.Create

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, transaction} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
