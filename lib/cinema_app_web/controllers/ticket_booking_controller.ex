defmodule CinemaAppWeb.TicketBookingController do
  use CinemaAppWeb, :controller

  alias CinemaApp.Bookings
  alias CinemaApp.Bookings.TicketBooking

  def index(conn, _params) do
    ticketbookings = Bookings.list_ticketbookings()
    render(conn, "index.html", ticketbookings: ticketbookings)
  end

  def new(conn, _params) do
    changeset = Bookings.change_ticket_booking(%TicketBooking{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ticket_booking" => ticket_booking_params}) do
    case Bookings.create_ticket_booking(ticket_booking_params) do
      {:ok, ticket_booking} ->
        conn
        |> put_flash(:info, "Ticket booking created successfully.")
        |> redirect(to: ticket_booking_path(conn, :show, ticket_booking))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
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
