defmodule CinemaApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CinemaApp.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :password_hash])
    |> validate_required([:name, :username, :email, :password_hash])
    |> unique_constraint(:username)
  end
end
