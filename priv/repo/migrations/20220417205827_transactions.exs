defmodule Cumbuca.Repo.Migrations.Transactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :origin_account_id, :binary_id
      add :destination_account_id, :binary_id
      add :amount, :decimal
      add :processing_date, :date

      timestamps()
    end
  end
end
