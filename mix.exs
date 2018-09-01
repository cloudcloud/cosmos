defmodule Cosmos.MixProject do
  use Mix.Project

  def project do
    [
      app: :cosmos,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        test: :test,
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Cosmos.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:distillery, "~> 2.0"},
      {:excoveralls, ">= 0.0.0", only: :test},
      {:gettext, "~> 0.11"},
      {:phoenix, "~> 1.3.4"},
      {:phoenix_pubsub, "~> 1.0"}
    ]
  end
end
