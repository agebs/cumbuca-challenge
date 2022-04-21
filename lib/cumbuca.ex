defmodule Cumbuca do
  @moduledoc """
  Cumbuca keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Cumbuca.Accounts.Create
  alias Cumbuca.Accounts.ViewBalance
  alias Cumbuca.Users.Login
  alias Cumbuca.Transactions.Query
  alias Cumbuca.Transactions.Create, as: TransactionCreate

  defdelegate create_account(params), to: Create, as: :call

  defdelegate view_balance(params), to: ViewBalance, as: :call

  defdelegate login(params), to: Login, as: :call

  defdelegate create_transaction(paramas), to: TransactionCreate, as: :call

  defdelegate list_transactions(params), to: Query, as: :call
end
