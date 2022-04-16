defmodule CumbucaWeb.FallbackController do
  use CumbucaWeb, :controller

  alias CumbucaWeb.ErrorView

  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
