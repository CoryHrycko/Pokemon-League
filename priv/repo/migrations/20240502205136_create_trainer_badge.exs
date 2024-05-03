defmodule PokemonLeague.Repo.Migrations.CreateTrainerBadge do
  use Ecto.Migration

  def change do
    create table(:trainer_badge) do
      add :trainer_id, references(:trainers, on_delete: :delete_all), null: false
      add :badge_id, references(:badges, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end
  end
end
