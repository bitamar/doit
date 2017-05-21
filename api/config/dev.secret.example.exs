use Mix.Config

config :doit, Doit.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "doit_dev",
  hostname: "localhost"
