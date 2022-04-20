defmodule CumbucaWeb.TransactionQueryView do
  use CumbucaWeb, :view

  def render("create.json", %{transactions: transactions}) do
    %{
      message: "Done!",
      transactions: transactions
    }
  end
end
