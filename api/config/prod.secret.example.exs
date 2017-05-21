use Mix.Config

config :doit, Doit.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "doit",
  hostname: "localhost"
