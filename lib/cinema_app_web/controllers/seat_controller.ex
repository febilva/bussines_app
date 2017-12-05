defmodule CinemaAppWeb.SeatController do
  use CinemaAppWeb, :controller

  alias CinemaApp.Bookings
  alias CinemaApp.Bookings.Seat

  def index(conn, _params) do
    seats = Bookings.list_seats()
    render(conn, "index.html", seats: seats)
  end

  def new(conn, _params) do
    changeset = Bookings.change_seat(%Seat{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"seat" => seat_params}) do
    case Bookings.create_seat(seat_params) do
      {:ok, seat} ->
        conn
        |> put_flash(:info, "Seat created successfully.")
        |> redirect(to: seat_path(conn, :show, seat))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    seat = Bookings.get_seat!(id)
    render(conn, "show.html", seat: seat)
  end

  def edit(conn, %{"id" => id}) do
    seat = Bookings.get_seat!(id)
    changeset = Bookings.change_seat(seat)
    render(conn, "edit.html", seat: seat, changeset: changeset)
  end

  def update(conn, %{"id" => id, "seat" => seat_params}) do
    seat = Bookings.get_seat!(id)

    case Bookings.update_seat(seat, seat_params) do
      {:ok, seat} ->
        conn
        |> put_flash(:info, "Seat updated successfully.")
        |> redirect(to: seat_path(conn, :show, seat))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", seat: seat, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    seat = Bookings.get_seat!(id)
    {:ok, _seat} = Bookings.delete_seat(seat)

    conn
    |> put_flash(:info, "Seat deleted successfully.")
    |> redirect(to: seat_path(conn, :index))
  end
end
