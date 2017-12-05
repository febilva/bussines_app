# CinemaApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * seed database using "mix run priv/repo/seeds.exs"
  * Start Phoenix endpoint with `mix phx.server`
  * uncomment the "plug Guardian.Plug.EnsureAuthenticated, handler: CinemaAppWeb.Api.V1.SessionController" for Authentication for the actions
  * postman request collection https://documenter.getpostman.com/view/882716/bussiness_app/77ib2qH


<!-- Now you can visit [`localhost:4000`](http://localhost:4000) from your browser. -->

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
