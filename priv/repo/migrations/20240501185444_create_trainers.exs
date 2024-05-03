defmodule PokemonLeague.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers) do
      add :name, :string
      add :age, :integer
      add :pokemon, {:array, :string}, null: false, default: []

      timestamps(type: :utc_datetime)
    end
  end
end
