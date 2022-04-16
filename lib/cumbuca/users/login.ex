defmodule Cumbuca.Users.Login do
  alias Cumbuca.Repo
  alias Cumbuca.User

  def call(params) do
    User
    |> Repo.get_by(email: params["email"])
    |> Argon2.check_pass(params["password"])
  end
end
