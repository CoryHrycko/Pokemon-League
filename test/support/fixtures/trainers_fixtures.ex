defmodule PokemonLeague.TrainersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonLeague.Trainers` context.
  """

  @doc """
  Generate a trainer.
  """
  def trainer_fixture(attrs \\ %{}) do
    {:ok, trainer} =
      attrs
      |> Enum.into(%{
        age: 42,
        badges: ["option1", "option2"],
        name: "some name",
        pokemon: ["option1", "option2"]
      })
      |> PokemonLeague.Trainers.create_trainer()

    trainer
  end
end
