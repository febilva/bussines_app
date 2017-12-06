defmodule CinemaAppWeb.Router do
  use CinemaAppWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  # Add this block
 scope "/" do
   pipe_through :browser
   coherence_routes()
 end

 # Add this block
 scope "/" do
   pipe_through :protected
   coherence_routes :protected
 end

 scope "/", CinemaAppWeb do
   pipe_through :browser
   get "/", PageController, :index
   # Add public routes below

 end

 scope "/", CinemaAppWeb do
   pipe_through :protected
   # Add protected routes below
   resources "/ticketbookings", TicketBookingController
   
 end
 #coherence config end

  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/", CinemaAppWeb do
    pipe_through :browser
    # Use the default browser stack
    get "/", PageController, :index
    resources "/seats", SeatController
    resources "/users", UserController

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
