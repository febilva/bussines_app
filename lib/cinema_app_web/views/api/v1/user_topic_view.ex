defmodule CinemaAppWeb.Api.V1.UserTopicView do
  require IEx
  use CinemaAppWeb,:view

  def render("user_topics.json", %{user_topics: user_topics}) do
      # IEx.pry
    # user_topics
    # render_many user_topics,CinemaAppWeb.Api.UserTopicView, "user_topic.json"
    %{
      user: %{
        id: user_topics.id,
        name: user_topics.name,
        # %{}
        topics: render_many(user_topics.topics,CinemaAppWeb.Api.V1.TopicView,"topic.json")


      }
    }
  end
  def render("user_topic.json",%{user_topics: user_topics})do
    # IEx.pry
    %{

    }
  end

end
