defmodule CumbucaWeb.UsersView do
  use CumbucaWeb, :view

  def render("user.json", %{user: user}) do
    %{
      user: %{
        email: user.email,
        password: user.password,
        id: user.id
      }
    }
  end

  def render("login.json", %{user: user, token: token}) do
    %{
      token: token,
      user_id: user.id
    }
  end
end
