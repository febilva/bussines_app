defmodule BusinessAppWeb.Api.V1.SessionView do
  use BusinessAppWeb, :view

  def render("show.json", %{jwt: jwt, user: user}) do
    %{
      token: jwt,
      user_details: %{id: user.id, username: user.name, email: user.email},
    }
  end

  def render("user.json", %{jwt: jwt}) do
    %{token: jwt}
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end

  def render("delete.json", _) do
    %{ok: true}
  end

  def render("forbidden.json", %{error: error}) do
    %{error: error}
  end
end
