defmodule CosmosWeb.Router do
  @moduledoc false

  use CosmosWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CosmosWeb do
    pipe_through :api
  end
end