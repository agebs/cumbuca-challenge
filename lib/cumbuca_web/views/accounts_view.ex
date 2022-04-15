defmodule CumbucaWeb.AccountsView do
  use CumbucaWeb, :view

  def render("create.json", %{account: account}) do
    %{
      message: "Conta cadastrada!",
      account: account
    }
  end
end
