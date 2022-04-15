defmodule Cumbuca.Account do
  #Recebe o nome e sobrenome do usuário
  #Recebe o CPF do usuário
  #Recebe o saldo inicial do usuário
  #Gera um token para o usuário
  #Armazena tudo no BD

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key{:id, :binary_id, autogenerate: true}

  @required_params [:name, :lastname, :cpf, :balance]

  @derive{Jason.Encoder, only: @required_params ++ [:id]}

  schema "account" do
    field :name, :string
    field :lastname, :string
    field :cpf, :string
    field :balance, :float

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params,@required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:cpf])
  end

end
