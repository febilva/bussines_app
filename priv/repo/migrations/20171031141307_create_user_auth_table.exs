defmodule BusinessApp.Repo.Migrations.CreateUserAuthTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password_hash, :string
      timpestamps()
    end
    create unique_index(:users, [:email])
  end
end
