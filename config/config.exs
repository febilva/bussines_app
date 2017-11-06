# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :business_app, ecto_repos: [BusinessApp.Repo]
# Configures the endpoint
config :business_app,
       BusinessAppWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "LJd8MSwXaC7zbZ1miYEXzRWteFmD9Ck8TPNg96QkNHwlUcyRfKPPcXhOTh7+4OR8",
       render_errors: [view: BusinessAppWeb.ErrorView, accepts: ~w(html json)],
       pubsub: [name: BusinessApp.PubSub, adapter: Phoenix.PubSub.PG2]
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
       issuer: "BusinessApp",
       ttl: {30, :days},
       allowed_drift: 2000,
       verify_issuer: true,
       secret_key: "+ljyKKWkSKEdS0Fm3BgaWY5xcqbJOjubd07mgtLJK412j4aa2i3xYayrq1W6JBCJ",
       serializer: # optional
       # optional
       BusinessAppWeb.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"