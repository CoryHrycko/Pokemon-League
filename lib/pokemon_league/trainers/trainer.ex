defmodule PokemonLeague.Trainers.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers" do
    field :name, :string
    field :age, :integer
    field :badges, {:array, :string}
    field :pokemon, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:name, :age, :badges, :pokemon])
    |> validate_required([:name, :age, :badges, :pokemon])
  end
end
