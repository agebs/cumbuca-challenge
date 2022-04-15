defmodule Cumbuca.Repo.Migrations.Account do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :name, :string
      add :lastname, :string
      add :cpf, :string
      add :balance, :float

      timestamps()
    end

    create unique_index(:account, [:cpf])
  end
end
