defmodule PokemonLeague.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers) do
      add :name, :string
      add :age, :integer
      add :badges, {:array, :string}
      add :pokemon, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
