defmodule PokemonLeagueWeb.TrainerBadgeHTML do
  use PokemonLeagueWeb, :html

  embed_templates "trainer_badge_html/*"

  @doc """
  Renders a trainer_badge form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def trainer_badge_form(assigns)
end
