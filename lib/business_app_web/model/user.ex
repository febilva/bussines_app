defmodule BusinessAppWeb.User do
  use BusinessAppWeb, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password,:string, virtual: true

    timestamps()
  end

end
