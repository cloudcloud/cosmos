defmodule CosmosWeb.Endpoint do
  @moduledoc false

  use Phoenix.Endpoint, otp_app: :cosmos

  socket "/socket", CosmosWeb.UserSocket

  plug Plug.Static,
    at: "/", from: :cosmos, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_cosmos_router",
    signing_salt: "Superfluous"

  plug CosmosWeb.Router

  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end