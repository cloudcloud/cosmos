defmodule CosmosWeb do
  @moduledoc false

  def controller do
    quote do
      use Phoenix.Controller, namespace: CosmosWeb
      import Plug.Conn
      import CosmosWeb.Router.Helpers
      import CosmosWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/cosmos_web/templates",
                        namespace: CosmosWeb
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]
      import CosmosWeb.Router.Helpers
      import CosmosWeb.ErrorHelpers
      import CosmosWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import CosmosWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end