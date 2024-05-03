defmodule PokemonLeague.TrainerBadges.TrainerBadge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainer_badge" do
    belongs_to :trainer, PokemonLeague.Trainers.Trainer
    belongs_to :badge, PokemonLeague.Badges.Badge

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trainer_badge, attrs) do
    trainer_badge
    |> cast(attrs, [])
    |> validate_required([])
  end
end
