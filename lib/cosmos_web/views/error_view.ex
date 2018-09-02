defmodule CosmosWeb.ErrorView do
  use CosmosWeb, :view
  alias Phoenix.Controller
  def template_not_found(template, _assigns) do
    %{
      errors: %{
        detail: Controller.status_message_from_template(template)
      }
    }
  end
end