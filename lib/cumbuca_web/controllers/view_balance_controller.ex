defmodule CumbucaWeb.ViewBalanceController do
  use CumbucaWeb, :controller

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def view(conn, params) do
    params = Map.put(params, "user_id", conn.assigns.user_id)

    with balances when is_list(balances) <- Cumbuca.view_balance(params) do
      conn
      |> put_status(:ok)
      |> render("view.json", balances: balances)
    end
  end
end
