defmodule CinemaApp.Bookings.TicketBooking do
  use Ecto.Schema
  import Ecto.Changeset
  alias CinemaApp.Bookings.TicketBooking
  alias CinemaApp.Accounts.User



  schema "ticketbookings" do
    field :seat_id, :integer
    field :show_status, :string
    field :show_time, :naive_datetime
    field :ticket_booking_code, :string
    belongs_to :user,  User
    timestamps()
  end

  @doc false
  def changeset(%TicketBooking{} = ticket_booking, attrs) do
    ticket_booking
    |> cast(attrs, [:show_time, :seat_id, :show_status, :ticket_booking_code])
    |> validate_required([:show_time, :seat_id, :show_status, :ticket_booking_code,:user_id])
  end
end
