defmodule CinemaAppWeb.TicketBookingController do
  require IEx
  use CinemaAppWeb, :controller
  import Ecto
  alias CinemaApp.Bookings
  alias CinemaApp.Accounts
  alias CinemaApp.Accounts.User
  alias CinemaApp.Bookings.TicketBooking

  def index(conn, _params) do

    ticketbookings = Bookings.list_ticketbookings()
    render(conn, "index.html", ticketbookings: ticketbookings)
  end

  def new(conn, _params) do
    changeset = Bookings.change_ticket_booking(%TicketBooking{})
    #getting all seats
    # query = from(c in Seat, select: {c.id, c.name})
    seats = Bookings.select_seats
    render(conn, "new.html", changeset: changeset,seats: seats)
  end

  def create(conn, %{"ticket_booking" => ticket_booking_params}) do

    current_user = Coherence.current_user(conn)
    user = Accounts.get_user!(current_user.id)
    # IEx.pry
    build_association = Ecto.build_assoc(current_user, :ticket_bookings,ticket_booking_params)
    # IEx.pry

    case Bookings.create_ticket_booking(build_association,ticket_booking_params) do
      {:ok, ticket_booking} ->
        conn
        |> put_flash(:info, "Ticket booking created successfully.")
        |> redirect(to: ticket_booking_path(conn, :show, ticket_booking))
      {:error, %Ecto.Changeset{} = changeset} ->
        seats = Bookings.select_seats
        render(conn, "new.html", changeset: changeset,seats: seats)
    end
  end

  def show(conn, %{"id" => id}) do
    ticket_booking = Bookings.get_ticket_booking!(id)
    render(conn, "show.html", ticket_booking: ticket_booking)
  end

  def edit(conn, %{"id" => id}) do
    ticket_booking = Bookings.get_ticket_booking!(id)
    changeset = Bookings.change_ticket_booking(ticket_booking)
    render(conn, "edit.html", ticket_booking: ticket_booking, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ticket_booking" => ticket_booking_params}) do
    ticket_booking = Bookings.get_ticket_booking!(id)

    case Bookings.update_ticket_booking(ticket_booking, ticket_booking_params) do
      {:ok, ticket_booking} ->
        conn
        |> put_flash(:info, "Ticket booking updated successfully.")
        |> redirect(to: ticket_booking_path(conn, :show, ticket_booking))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ticket_booking: ticket_booking, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ticket_booking = Bookings.get_ticket_booking!(id)
    {:ok, _ticket_booking} = Bookings.delete_ticket_booking(ticket_booking)

    conn
    |> put_flash(:info, "Ticket booking deleted successfully.")
    |> redirect(to: ticket_booking_path(conn, :index))
  end
end
