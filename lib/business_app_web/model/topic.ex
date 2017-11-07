defmodule BusinessAppWeb.Topic do
  use BusinessAppWeb, :model

  schema "topics" do
    field :topic_name, :string
    many_to_many :users,BusinessAppWeb.User,join_through: "topic_of_interestes"
  end

end
