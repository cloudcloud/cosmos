use Mix.Config

config :logger, :console, format: "$time $metadata[$level] $message\n"

config :cosmos, CosmosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "474296909282810039dd6d3fad272e0478aa6f6919514",
  render_errors: [view: CosmosWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CosmosWeb.PubSub, adapter: Phoenix.PubSub.PG2]
