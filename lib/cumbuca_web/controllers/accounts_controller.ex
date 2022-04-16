defmodule CumbucaWeb.AccountsController do
  use CumbucaWeb, :controller

  alias Cumbuca.Account

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    params = Map.put(params, "user_id", conn.assigns.user_id)
    with {:ok, %Account{} = account} <- Cumbuca.create_account(params) do
      conn
      |> put_status(:created)
      |> render("create.json", account: account)
    end
  end
end
