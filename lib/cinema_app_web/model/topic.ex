defmodule CinemaAppWeb.Topic do
  use CinemaAppWeb, :model

  schema "topics" do
    field :topic_name, :string
    many_to_many :users,CinemaAppWeb.User,join_through: "topic_of_interestes"
  end

end
