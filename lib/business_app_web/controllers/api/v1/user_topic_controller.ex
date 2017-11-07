defmodule BusinessAppWeb.Api.V1.UserTopicController do
  use BusinessAppWeb,:controller
  alias BusinessApp.Repo
  require IEx

  def user_topic(conn, %{"id" => id}) do
    user_topics = BusinessApp.Repo.get(BusinessAppWeb.User,id) |> Repo.preload(:topics)
    render conn,"user_topics.json", user_topics: user_topics

  end

end
