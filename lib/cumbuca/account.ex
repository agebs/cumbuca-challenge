defmodule Cumbuca.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cumbuca.User

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:name, :lastname, :cpf, :initial_balance, :balance, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "accounts" do
    field :name, :string
    field :lastname, :string
    field :cpf, :string
    field :balance, :decimal
    field :initial_balance, :decimal

    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:balance, greater_than_or_equal_to: 0)
    |> validate_number(:initial_balance, greater_than_or_equal_to: 0)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:cpf])
  end
end
