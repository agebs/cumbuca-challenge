defmodule Cumbuca.Repo.Migrations.AddFkUserToAccount do
  use Ecto.Migration

  def change do
    alter table(:accounts) do
      add :user_id, references(:users, type: :binary_id)
    end
  end
end
