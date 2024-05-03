defmodule PokemonLeague.TrainerBadgesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonLeague.TrainerBadges` context.
  """

  @doc """
  Generate a trainer_badge.
  """
  def trainer_badge_fixture(attrs \\ %{}) do
    {:ok, trainer_badge} =
      attrs
      |> Enum.into(%{

      })
      |> PokemonLeague.TrainerBadges.create_trainer_badge()

    trainer_badge
  end
end
