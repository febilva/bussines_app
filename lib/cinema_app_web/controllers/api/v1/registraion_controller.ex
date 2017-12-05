defmodule CinemaAppWeb.Api.V1.RegistrationController do
  require IEx

  use CinemaAppWeb, :controller

  alias CinemaAppWeb.User
  alias CinemaApp.Repo

  # def create(conn,%{"user" => user_params}) do
  #   changeset = User.changeset(%User{},user_params)
  #
  # end
  plug :scrub_params, "user" when action in [:create]
  def create(conn, %{"user" => user_params}) do
    # IEx.pry
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} =
          user
          |> Guardian.encode_and_sign(:token)
        conn
        |> put_status(:created)
        |> render(CinemaAppWeb.Api.V1.SessionView,
                  "show.json",
                  jwt: jwt, user: user)

      # IEx.pry
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", changeset: changeset)
    end
  end
end
