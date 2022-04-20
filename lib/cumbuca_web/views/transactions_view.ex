defmodule CumbucaWeb.TransactionsView do
  use CumbucaWeb, :view

  def render("transaction.json", %{transaction: transaction}) do
    %{
      message: "Successful transaction.",
      transaction: transaction
    }
  end
end
