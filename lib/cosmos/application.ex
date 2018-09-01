defmodule Cosmos.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(CosmosWeb.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: Cosmos.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
