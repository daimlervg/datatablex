# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :datatablex,
  ecto_repos: [Datatablex.Repo]

# Configures the endpoint
config :datatablex, DatatablexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MmNslv25uJEE0ZicWPx5lDxcbYJ0UhOEKwPbJYd+4lei9xntJmmRtvqmozUU2AKB",
  render_errors: [view: DatatablexWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Datatablex.PubSub,
  live_view: [signing_salt: "B7VVNcfG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
