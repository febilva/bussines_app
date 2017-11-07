defmodule BusinessAppWeb.Api.V1.TopicView do
  use BusinessAppWeb, :view

  def render("topic.json", %{topic: topic}) do
    %{
      id: topic.id,
      name: topic.topic_name
    }
  end
end
