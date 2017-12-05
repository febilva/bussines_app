defmodule CinemaApp.Repo.Migrations.CreateTicketbookings do
  use Ecto.Migration

  def change do
    create table(:ticketbookings) do
      add :show_time, :naive_datetime
      add :seat_id, :integer
      add :show_status, :string
      add :ticket_booking_code, :string

      timestamps()
    end

  end
end
