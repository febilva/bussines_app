defmodule CinemaAppWeb.PageController do
  use CinemaAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
