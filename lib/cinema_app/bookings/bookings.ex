defmodule CinemaApp.Bookings do
  @moduledoc """
  The Bookings context.
  """

  import Ecto.Query, warn: false
  alias CinemaApp.Repo

  alias CinemaApp.Bookings.Seat

  @doc """
  Returns the list of seats.

  ## Examples

      iex> list_seats()
      [%Seat{}, ...]

  """
  def list_seats do
    Repo.all(Seat)
  end
  @doc """
  Returns the list of seats.

  ## Examples

      iex> list_seats()
      [%Seat{}, ...]

  """
  def select_seats do
    query = from(c in Seat, select: {c.id, c.seat_no})
    Repo.all(query)
  end

  @doc """
  Gets a single seat.

  Raises `Ecto.NoResultsError` if the Seat does not exist.

  ## Examples

      iex> get_seat!(123)
      %Seat{}

      iex> get_seat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_seat!(id), do: Repo.get!(Seat, id)

  @doc """
  Creates a seat.

  ## Examples

      iex> create_seat(%{field: value})
      {:ok, %Seat{}}

      iex> create_seat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_seat(attrs \\ %{}) do
    %Seat{}
    |> Seat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a seat.

  ## Examples

      iex> update_seat(seat, %{field: new_value})
      {:ok, %Seat{}}

      iex> update_seat(seat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_seat(%Seat{} = seat, attrs) do
    seat
    |> Seat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Seat.

  ## Examples

      iex> delete_seat(seat)
      {:ok, %Seat{}}

      iex> delete_seat(seat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_seat(%Seat{} = seat) do
    Repo.delete(seat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking seat changes.

  ## Examples

      iex> change_seat(seat)
      %Ecto.Changeset{source: %Seat{}}

  """
  def change_seat(%Seat{} = seat) do
    Seat.changeset(seat, %{})
  end

  alias CinemaApp.Bookings.TicketBooking

  @doc """
  Returns the list of ticketbookings.

  ## Examples

      iex> list_ticketbookings()
      [%TicketBooking{}, ...]

  """
  def list_ticketbookings do
    Repo.all(TicketBooking)
  end

  @doc """
  Gets a single ticket_booking.

  Raises `Ecto.NoResultsError` if the Ticket booking does not exist.

  ## Examples

      iex> get_ticket_booking!(123)
      %TicketBooking{}

      iex> get_ticket_booking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ticket_booking!(id), do: Repo.get!(TicketBooking, id)

  @doc """
  Creates a ticket_booking.

  ## Examples

      iex> create_ticket_booking(%{field: value})
      {:ok, %TicketBooking{}}

      iex> create_ticket_booking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ticket_booking(attrs \\ %{}) do
    %TicketBooking{}
    |> TicketBooking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ticket_booking.

  ## Examples

      iex> update_ticket_booking(ticket_booking, %{field: new_value})
      {:ok, %TicketBooking{}}

      iex> update_ticket_booking(ticket_booking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ticket_booking(%TicketBooking{} = ticket_booking, attrs) do
    ticket_booking
    |> TicketBooking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TicketBooking.

  ## Examples

      iex> delete_ticket_booking(ticket_booking)
      {:ok, %TicketBooking{}}

      iex> delete_ticket_booking(ticket_booking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ticket_booking(%TicketBooking{} = ticket_booking) do
    Repo.delete(ticket_booking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ticket_booking changes.

  ## Examples

      iex> change_ticket_booking(ticket_booking)
      %Ecto.Changeset{source: %TicketBooking{}}

  """
  def change_ticket_booking(%TicketBooking{} = ticket_booking) do
    TicketBooking.changeset(ticket_booking, %{})
  end
end
