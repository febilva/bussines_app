defmodule CinemaApp.Accounts.User do
  use Ecto.Schema
  use Coherence.Schema                                    # Add this



  import Ecto.Changeset
  alias CinemaApp.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_for_future_change, :string
    field :username, :string
    coherence_schema()                                    # Add this


    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email] ++ coherence_fields)  # Add this
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(attrs)                         # Add this
  end
end
