defmodule CinemaApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :email, :string
      add :password_has_for_change, :string

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])

  end
end
