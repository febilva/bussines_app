defmodule CinemaApp.BookingsTest do
  use CinemaApp.DataCase

  alias CinemaApp.Bookings

  describe "seats" do
    alias CinemaApp.Bookings.Seat

    @valid_attrs %{seat_code: "some seat_code", seat_name: "some seat_name", seat_no: 42}
    @update_attrs %{seat_code: "some updated seat_code", seat_name: "some updated seat_name", seat_no: 43}
    @invalid_attrs %{seat_code: nil, seat_name: nil, seat_no: nil}

    def seat_fixture(attrs \\ %{}) do
      {:ok, seat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookings.create_seat()

      seat
    end

    test "list_seats/0 returns all seats" do
      seat = seat_fixture()
      assert Bookings.list_seats() == [seat]
    end

    test "get_seat!/1 returns the seat with given id" do
      seat = seat_fixture()
      assert Bookings.get_seat!(seat.id) == seat
    end

    test "create_seat/1 with valid data creates a seat" do
      assert {:ok, %Seat{} = seat} = Bookings.create_seat(@valid_attrs)
      assert seat.seat_code == "some seat_code"
      assert seat.seat_name == "some seat_name"
      assert seat.seat_no == 42
    end

    test "create_seat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_seat(@invalid_attrs)
    end

    test "update_seat/2 with valid data updates the seat" do
      seat = seat_fixture()
      assert {:ok, seat} = Bookings.update_seat(seat, @update_attrs)
      assert %Seat{} = seat
      assert seat.seat_code == "some updated seat_code"
      assert seat.seat_name == "some updated seat_name"
      assert seat.seat_no == 43
    end

    test "update_seat/2 with invalid data returns error changeset" do
      seat = seat_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_seat(seat, @invalid_attrs)
      assert seat == Bookings.get_seat!(seat.id)
    end

    test "delete_seat/1 deletes the seat" do
      seat = seat_fixture()
      assert {:ok, %Seat{}} = Bookings.delete_seat(seat)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_seat!(seat.id) end
    end

    test "change_seat/1 returns a seat changeset" do
      seat = seat_fixture()
      assert %Ecto.Changeset{} = Bookings.change_seat(seat)
    end
  end

  describe "ticketbookings" do
    alias CinemaApp.Bookings.TicketBooking

    @valid_attrs %{seat_id: 42, show_status: "some show_status", show_time: ~N[2010-04-17 14:00:00.000000], ticket_booking_code: "some ticket_booking_code"}
    @update_attrs %{seat_id: 43, show_status: "some updated show_status", show_time: ~N[2011-05-18 15:01:01.000000], ticket_booking_code: "some updated ticket_booking_code"}
    @invalid_attrs %{seat_id: nil, show_status: nil, show_time: nil, ticket_booking_code: nil}

    def ticket_booking_fixture(attrs \\ %{}) do
      {:ok, ticket_booking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookings.create_ticket_booking()

      ticket_booking
    end

    test "list_ticketbookings/0 returns all ticketbookings" do
      ticket_booking = ticket_booking_fixture()
      assert Bookings.list_ticketbookings() == [ticket_booking]
    end

    test "get_ticket_booking!/1 returns the ticket_booking with given id" do
      ticket_booking = ticket_booking_fixture()
      assert Bookings.get_ticket_booking!(ticket_booking.id) == ticket_booking
    end

    test "create_ticket_booking/1 with valid data creates a ticket_booking" do
      assert {:ok, %TicketBooking{} = ticket_booking} = Bookings.create_ticket_booking(@valid_attrs)
      assert ticket_booking.seat_id == 42
      assert ticket_booking.show_status == "some show_status"
      assert ticket_booking.show_time == ~N[2010-04-17 14:00:00.000000]
      assert ticket_booking.ticket_booking_code == "some ticket_booking_code"
    end

    test "create_ticket_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_ticket_booking(@invalid_attrs)
    end

    test "update_ticket_booking/2 with valid data updates the ticket_booking" do
      ticket_booking = ticket_booking_fixture()
      assert {:ok, ticket_booking} = Bookings.update_ticket_booking(ticket_booking, @update_attrs)
      assert %TicketBooking{} = ticket_booking
      assert ticket_booking.seat_id == 43
      assert ticket_booking.show_status == "some updated show_status"
      assert ticket_booking.show_time == ~N[2011-05-18 15:01:01.000000]
      assert ticket_booking.ticket_booking_code == "some updated ticket_booking_code"
    end

    test "update_ticket_booking/2 with invalid data returns error changeset" do
      ticket_booking = ticket_booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_ticket_booking(ticket_booking, @invalid_attrs)
      assert ticket_booking == Bookings.get_ticket_booking!(ticket_booking.id)
    end

    test "delete_ticket_booking/1 deletes the ticket_booking" do
      ticket_booking = ticket_booking_fixture()
      assert {:ok, %TicketBooking{}} = Bookings.delete_ticket_booking(ticket_booking)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_ticket_booking!(ticket_booking.id) end
    end

    test "change_ticket_booking/1 returns a ticket_booking changeset" do
      ticket_booking = ticket_booking_fixture()
      assert %Ecto.Changeset{} = Bookings.change_ticket_booking(ticket_booking)
    end
  end
end
