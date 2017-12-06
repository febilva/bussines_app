# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cinema_app, ecto_repos: [CinemaApp.Repo]
# Configures the endpoint
config :cinema_app,
       CinemaAppWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "LJd8MSwXaC7zbZ1miYEXzRWteFmD9Ck8TPNg96QkNHwlUcyRfKPPcXhOTh7+4OR8",
       render_errors: [view: CinemaAppWeb.ErrorView, accepts: ~w(html json)],
       pubsub: [name: CinemaApp.PubSub, adapter: Phoenix.PubSub.PG2]
# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n", metadata: [:request_id]
#guardian settings
config :guardian,
       Guardian,
       allowed_algos: ["HS512"],
       verify_module: # optional
       Guardian.JWT,
       issuer: "CinemaApp",
       ttl: {30, :days},
       allowed_drift: 2000,
       verify_issuer: true,
       secret_key: "+ljyKKWkSKEdS0Fm3BgaWY5xcqbJOjubd07mgtLJK412j4aa2i3xYayrq1W6JBCJ",
       serializer: # optional
       # optional
       CinemaAppWeb.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: CinemaApp.Accounts.User,
  repo: CinemaApp.Repo,
  module: CinemaApp,
  web_module: CinemaAppWeb,
  router: CinemaAppWeb.Router,
  messages_backend: CinemaAppWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, CinemaAppWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: CinemaApp.Accounts.User,
  repo: CinemaApp.Repo,
  module: CinemaApp,
  web_module: CinemaAppWeb,
  router: CinemaAppWeb.Router,
  messages_backend: CinemaAppWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, CinemaAppWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
