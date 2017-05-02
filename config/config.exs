# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :doit,
  ecto_repos: [Doit.Repo]

# Configures the endpoint
config :doit, Doit.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BC0RV/JIcptZHOCMH4px7SfVaTcvpgWf1DCRaik+C0/4OJ0fp5s1Ycz5xaWVQjLw",
  render_errors: [view: Doit.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Doit.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
