defmodule CinemaAppWeb.Api.V1.UserTopicController do
  use CinemaAppWeb,:controller
  alias CinemaApp.Repo
  require IEx

  # plug Guardian.Plug.EnsureAuthenticated, handler: CinemaAppWeb.Api.V1.SessionController


  def user_topic(conn, %{"id" => id}) do
    user_topics = CinemaApp.Repo.get(CinemaAppWeb.User,id) |> Repo.preload(:topics)
    render conn,"user_topics.json", user_topics: user_topics

  end

end
