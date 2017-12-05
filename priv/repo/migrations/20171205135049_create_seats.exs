defmodule CinemaApp.Repo.Migrations.CreateSeats do
  use Ecto.Migration

  def change do
    create table(:seats) do
      add :seat_no, :integer
      add :seat_code, :string
      add :seat_name, :string

      timestamps()
    end

  end
end
