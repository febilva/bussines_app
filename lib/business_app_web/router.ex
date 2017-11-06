defmodule BusinessAppWeb.Router do
  use BusinessAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/", BusinessAppWeb do
    pipe_through :browser
    # Use the default browser stack
    get "/", PageController, :index
  end
  # Other scopes may use custom stacks.
  # scope "/api", BusinessAppWeb do
  #   pipe_through :api
  # end
  scope "/api", BusinessAppWeb, as: :api do
    pipe_through :api
    scope "/v1", Api.V1, as: :v1 do
      post "/registration", RegistrationController, :create
      post "/login", SessionController, :create
      delete "/sessions", SessionController, :delete
    end
  end
end
