defmodule CumbucaWeb.TransactionQueryController do
  use CumbucaWeb, :controller

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def list(conn, params) do
    params = Map.put(params, "user_id", conn.assigns.user_id)
    with transactions when is_list(transactions) <- Cumbuca.list_transactions(params) do
      conn
      |> put_status(:created)
      |> render("create.json", transactions: transactions)
    end
  end
end
