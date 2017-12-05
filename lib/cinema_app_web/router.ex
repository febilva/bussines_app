defmodule CinemaAppWeb.Router do
  use CinemaAppWeb, :router

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
  scope "/", CinemaAppWeb do
    pipe_through :browser
    # Use the default browser stack
    get "/", PageController, :index
    resources "/ticketbookings", TicketBookingController
    resources "/seats", SeatController
    resources "/users", UserController
    resources "/registrations", RegistrationController, only: [:new, :create]

  end
  # Other scopes may use custom stacks.
  # scope "/api", CinemaAppWeb do
  #   pipe_through :api
  # end
  scope "/api", CinemaAppWeb, as: :api do
    pipe_through :api
    scope "/v1", Api.V1, as: :v1 do
      post "/registration", RegistrationController, :create
      post "/login", SessionController, :create
      get "/user_topic/:id", UserTopicController,:user_topic
      delete "/sessions", SessionController, :delete
    end
  end
end
