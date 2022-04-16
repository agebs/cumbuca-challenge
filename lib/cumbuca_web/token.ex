defmodule CumbucaWeb.Token do
  alias Phoenix.Token
  alias CumbucaWeb.Endpoint
  alias Cumbuca.User

  @salt "token_account"

  @ttl 86400

  def create(%User{id: user_id}) do
    Token.sign(CumbucaWeb.Endpoint, @salt, %{user_id: user_id})
  end

  def verify(token) do
    case Token.verify(Endpoint, @salt, token, max_age: @ttl) do
      {:ok, _user_data} = response -> response
      _error -> {:error, :unauthorized}
    end
  end
end
