defmodule CumbucaWeb.AccountsView do
  use CumbucaWeb, :view

  def render("create.json", %{account: account}) do
    %{
      message: "Account created!",
      account: account
    }
  end

  def render("view.json", %{balances: balances}) do
    balances =
      Enum.map(balances, fn account ->
        %{balance: account.balance, id: account.id}
      end)

    %{
      message: "Done!",
      balances: balances
    }
  end
end
