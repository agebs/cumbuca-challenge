defmodule CumbucaWeb.AccountsController do
  use CumbucaWeb, :controller

  alias Cumbuca.Account

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Cumbuca.create_account(params) do
      conn
      |> put_status(:created)
      |> render("create.json", account: account)
    end
  end
end
