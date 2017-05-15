defmodule Doit.Mixfile do
  use Mix.Project

  def project do
    [app: :doit,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Doit, []},
     applications: [:comeonin, :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :mariaex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(:travis), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:comeonin, "2.6.0"},
     {:cors_plug, "1.2.1"},
     {:cowboy, "1.1.2"},
     {:gettext, "0.13.1"},
     {:mariaex, "0.8.2"},
     {:phoenix, "1.2.3"},
     {:phoenix_ecto, "3.2.3"},
     {:phoenix_html, "2.9.3"},
     {:phoenix_live_reload, "1.0.8", only: :dev},
     {:phoenix_pubsub, "1.0.1"},
     {:secure_random, "0.5.1"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
