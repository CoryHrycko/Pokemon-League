defmodule PokemonLeague.BadgesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonLeague.Badges` context.
  """

  @doc """
  Generate a badge.
  """
  def badge_fixture(attrs \\ %{}) do
    {:ok, badge} =
      attrs
      |> Enum.into(%{
        name: "some name",
        type: 42
      })
      |> PokemonLeague.Badges.create_badge()

    badge
  end
end
