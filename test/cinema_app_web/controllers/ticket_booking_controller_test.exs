defmodule CinemaAppWeb.TicketBookingControllerTest do
  use CinemaAppWeb.ConnCase

  alias CinemaApp.Bookings

  @create_attrs %{seat_id: 42, show_status: "some show_status", show_time: ~N[2010-04-17 14:00:00.000000], ticket_booking_code: "some ticket_booking_code"}
  @update_attrs %{seat_id: 43, show_status: "some updated show_status", show_time: ~N[2011-05-18 15:01:01.000000], ticket_booking_code: "some updated ticket_booking_code"}
  @invalid_attrs %{seat_id: nil, show_status: nil, show_time: nil, ticket_booking_code: nil}

  def fixture(:ticket_booking) do
    {:ok, ticket_booking} = Bookings.create_ticket_booking(@create_attrs)
    ticket_booking
  end

  describe "index" do
    test "lists all ticketbookings", %{conn: conn} do
      conn = get conn, ticket_booking_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Ticketbookings"
    end
  end

  describe "new ticket_booking" do
    test "renders form", %{conn: conn} do
      conn = get conn, ticket_booking_path(conn, :new)
      assert html_response(conn, 200) =~ "New Ticket booking"
    end
  end

  describe "create ticket_booking" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, ticket_booking_path(conn, :create), ticket_booking: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ticket_booking_path(conn, :show, id)

      conn = get conn, ticket_booking_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Ticket booking"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ticket_booking_path(conn, :create), ticket_booking: @invalid_attrs
      assert html_response(conn, 200) =~ "New Ticket booking"
    end
  end

  describe "edit ticket_booking" do
    setup [:create_ticket_booking]

    test "renders form for editing chosen ticket_booking", %{conn: conn, ticket_booking: ticket_booking} do
      conn = get conn, ticket_booking_path(conn, :edit, ticket_booking)
      assert html_response(conn, 200) =~ "Edit Ticket booking"
    end
  end

  describe "update ticket_booking" do
    setup [:create_ticket_booking]

    test "redirects when data is valid", %{conn: conn, ticket_booking: ticket_booking} do
      conn = put conn, ticket_booking_path(conn, :update, ticket_booking), ticket_booking: @update_attrs
      assert redirected_to(conn) == ticket_booking_path(conn, :show, ticket_booking)

      conn = get conn, ticket_booking_path(conn, :show, ticket_booking)
      assert html_response(conn, 200) =~ "some updated show_status"
    end

    test "renders errors when data is invalid", %{conn: conn, ticket_booking: ticket_booking} do
      conn = put conn, ticket_booking_path(conn, :update, ticket_booking), ticket_booking: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Ticket booking"
    end
  end

  describe "delete ticket_booking" do
    setup [:create_ticket_booking]

    test "deletes chosen ticket_booking", %{conn: conn, ticket_booking: ticket_booking} do
      conn = delete conn, ticket_booking_path(conn, :delete, ticket_booking)
      assert redirected_to(conn) == ticket_booking_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, ticket_booking_path(conn, :show, ticket_booking)
      end
    end
  end

  defp create_ticket_booking(_) do
    ticket_booking = fixture(:ticket_booking)
    {:ok, ticket_booking: ticket_booking}
  end
end
