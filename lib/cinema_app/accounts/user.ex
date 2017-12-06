defmodule CinemaApp.Accounts.User do
  use Ecto.Schema
  use Coherence.Schema                                    # Add this



  import Ecto.Changeset
  alias CinemaApp.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :username, :string
    coherence_schema()                                    # Add this


    timestamps()
  end

  @doc false
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)  # Add this
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(params)                         # Add this
  end
end
