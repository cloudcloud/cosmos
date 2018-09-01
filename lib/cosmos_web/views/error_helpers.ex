defmodule CosmosWeb.ErrorHelpers do
  @moduledoc false

  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(CosmosWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(CosmosWeb.Gettext, "errors", msg, opts)
    end
  end
end
