use Mix.Config

config :doit, Doit.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "doit_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
