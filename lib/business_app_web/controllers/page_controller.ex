defmodule BusinessAppWeb.PageController do
  use BusinessAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
