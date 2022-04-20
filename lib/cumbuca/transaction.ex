defmodule Cumbuca.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cumbuca.Account

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:origin_account_id, :destination_account_id, :amount, :processing_date]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "transactions" do
    field :amount, :decimal
    field :processing_date, :date

    belongs_to :origin_account, Account
    belongs_to :destination_account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
