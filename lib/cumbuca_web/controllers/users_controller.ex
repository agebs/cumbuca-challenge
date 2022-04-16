defmodule CumbucaWeb.UsersController do
  use CumbucaWeb, :controller

  alias Cumbuca.Users.Create
  alias CumbucaWeb.Token

  alias CumbucaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end

  def login(conn, params) do
    case Cumbuca.login(params) do
      {:error, _} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{message: "User not found or incorrect password."})

      {:ok, user} ->
        token = Token.create(user)

        conn
        |> put_status(:created)
        |> render("login.json", user: user, token: token)
    end
  end
end
