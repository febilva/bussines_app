defmodule CinemaAppWeb.RegistrationController do
  use CinemaAppWeb, :controller
  import Ecto.Changeset
  alias CinemaApp.Accounts
  alias CinemaApp.Accounts.User

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render conn, changeset: changeset
  end


  def create(conn, %{"user" => user_params}) do
    changeset = Accounts.change_user(%User{}, user_params)

    case Blog.Registration.create(changeset, Blog.Repo) do
      {:ok, changeset} ->
        # sign in the user
      {:error, changeset} ->
        # show error message
    end
  end

end
