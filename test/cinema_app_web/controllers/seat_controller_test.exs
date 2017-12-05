defmodule CinemaAppWeb.SeatControllerTest do
  use CinemaAppWeb.ConnCase

  alias CinemaApp.Bookings

  @create_attrs %{seat_code: "some seat_code", seat_name: "some seat_name", seat_no: 42}
  @update_attrs %{seat_code: "some updated seat_code", seat_name: "some updated seat_name", seat_no: 43}
  @invalid_attrs %{seat_code: nil, seat_name: nil, seat_no: nil}

  def fixture(:seat) do
    {:ok, seat} = Bookings.create_seat(@create_attrs)
    seat
  end

  describe "index" do
    test "lists all seats", %{conn: conn} do
      conn = get conn, seat_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Seats"
    end
  end

  describe "new seat" do
    test "renders form", %{conn: conn} do
      conn = get conn, seat_path(conn, :new)
      assert html_response(conn, 200) =~ "New Seat"
    end
  end

  describe "create seat" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, seat_path(conn, :create), seat: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == seat_path(conn, :show, id)

      conn = get conn, seat_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Seat"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, seat_path(conn, :create), seat: @invalid_attrs
      assert html_response(conn, 200) =~ "New Seat"
    end
  end

  describe "edit seat" do
    setup [:create_seat]

    test "renders form for editing chosen seat", %{conn: conn, seat: seat} do
      conn = get conn, seat_path(conn, :edit, seat)
      assert html_response(conn, 200) =~ "Edit Seat"
    end
  end

  describe "update seat" do
    setup [:create_seat]

    test "redirects when data is valid", %{conn: conn, seat: seat} do
      conn = put conn, seat_path(conn, :update, seat), seat: @update_attrs
      assert redirected_to(conn) == seat_path(conn, :show, seat)

      conn = get conn, seat_path(conn, :show, seat)
      assert html_response(conn, 200) =~ "some updated seat_code"
    end

    test "renders errors when data is invalid", %{conn: conn, seat: seat} do
      conn = put conn, seat_path(conn, :update, seat), seat: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Seat"
    end
  end

  describe "delete seat" do
    setup [:create_seat]

    test "deletes chosen seat", %{conn: conn, seat: seat} do
      conn = delete conn, seat_path(conn, :delete, seat)
      assert redirected_to(conn) == seat_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, seat_path(conn, :show, seat)
      end
    end
  end

  defp create_seat(_) do
    seat = fixture(:seat)
    {:ok, seat: seat}
  end
end
