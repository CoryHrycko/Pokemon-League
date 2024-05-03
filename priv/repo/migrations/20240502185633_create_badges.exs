defmodule PokemonLeague.Repo.Migrations.CreateBadges do
  use Ecto.Migration

  def change do
    create table(:badges) do
      add :name, :string, default: ""
      add :type, :integer, default: 0

      timestamps(type: :utc_datetime)
    end
  end
end
