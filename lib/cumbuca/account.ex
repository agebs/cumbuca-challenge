defmodule Cumbuca.Account do
  #Recebe o nome e sobrenome do usuário
  #Recebe o CPF do usuário
  #Recebe o saldo inicial do usuário
  #Gera um token para o usuário
  #Armazena tudo no BD

  use Ecto.Schema
  import Ecto.Changeset

  alias Cumbuca.User

  @primary_key{:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:name, :lastname, :cpf, :balance, :user_id]

  @derive{Jason.Encoder, only: @required_params ++ [:id]}

  schema "accounts" do
    field :name, :string
    field :lastname, :string
    field :cpf, :string
    field :balance, :float

    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params,@required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:cpf])
  end

end
