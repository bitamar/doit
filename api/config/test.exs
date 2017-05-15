use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :doit, Doit.Endpoint,
  http: [port: 4001],
  server: false

# Turn off encryption on tests.
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :doit, Doit.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "travis",
  password: "",
  database: "test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
