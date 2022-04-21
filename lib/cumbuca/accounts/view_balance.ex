defmodule Cumbuca.Accounts.ViewBalance do
  import Ecto.Query
  alias Cumbuca.{Repo, Account}

  def call(params) do
    user_id = params["user_id"]

    query =
      from a in Account,
        where: a.user_id == ^user_id,
        select: [:balance, :id]

    Repo.all(query)
  end
end
