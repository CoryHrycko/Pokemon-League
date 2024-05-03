defmodule PokemonLeagueWeb.BadgeHTML do
  use PokemonLeagueWeb, :html

  embed_templates "badge_html/*"

  @doc """
  Renders a badge form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def badge_form(assigns)
end
