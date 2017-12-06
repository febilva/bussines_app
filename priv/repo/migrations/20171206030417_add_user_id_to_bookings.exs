defmodule CinemaApp.Repo.Migrations.AddUserIdToBookings do
  use Ecto.Migration

  def change do
    alter table (:ticketbookings) do
      add :user_id, :integer
    end
  end
end
