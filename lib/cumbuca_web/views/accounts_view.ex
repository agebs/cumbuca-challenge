defmodule CumbucaWeb.AccountsView do
  use CumbucaWeb, :view

  def render("create.json", %{account: account}) do
    %{
      message: "Account created!",
      account: account
    }
  end
end
