# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :countdown,
  ecto_repos: [Countdown.Repo]

# Configures the endpoint
config :countdown, CountdownWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h2mY7GbA7VHpOlIf9gI5iuyKTP1dbz4JmlxwbxCz/68Ipf0+IIe03tqKaZpb62Z5",
  render_errors: [view: CountdownWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Countdown.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: System.get_env("AUTH0_DOMAIN"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: System.get_env("AUTH0_CLIENT_SECRET")
