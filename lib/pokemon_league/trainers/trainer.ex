defmodule PokemonLeague.Trainers.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers" do
    field :name, :string
    field :age, :integer
    field :pokemon, {:array, :string}, default: []
    many_to_many :badges, PokemonLeague.Badges.Badge,
      join_through: "trainer_badges",
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:name, :age, :pokemon])
    |> validate_required([:name, :age])
  end
end
