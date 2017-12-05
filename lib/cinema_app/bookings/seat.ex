defmodule CinemaApp.Bookings.Seat do
  use Ecto.Schema
  import Ecto.Changeset
  alias CinemaApp.Bookings.Seat


  schema "seats" do
    field :seat_code, :string
    field :seat_name, :string
    field :seat_no, :integer

    timestamps()
  end

  @doc false
  def changeset(%Seat{} = seat, attrs) do
    seat
    |> cast(attrs, [:seat_no, :seat_code, :seat_name])
    |> validate_required([:seat_no, :seat_code, :seat_name])
  end
end
