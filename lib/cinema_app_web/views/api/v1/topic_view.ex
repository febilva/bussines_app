defmodule CinemaAppWeb.Api.V1.TopicView do
  use CinemaAppWeb, :view

  def render("topic.json", %{topic: topic}) do
    %{
      id: topic.id,
      name: topic.topic_name
    }
  end
end
