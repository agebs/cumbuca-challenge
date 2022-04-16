defmodule Cumbuca do
  @moduledoc """
  Cumbuca keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Cumbuca.Accounts.Create
  alias Cumbuca.Users.Login

  defdelegate create_account(params), to: Create, as: :call

  defdelegate login(params), to: Login, as: :call

end
