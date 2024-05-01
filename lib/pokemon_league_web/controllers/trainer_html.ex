defmodule PokemonLeagueWeb.TrainerHTML do
  use PokemonLeagueWeb, :html

  embed_templates "trainer_html/*"

  @doc """
  Renders a trainer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def trainer_form(assigns)
end
