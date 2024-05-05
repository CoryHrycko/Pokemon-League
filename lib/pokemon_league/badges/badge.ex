defmodule PokemonLeague.Badges.Badge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "badges" do
    field :name, :string
    field :type, :integer
    many_to_many :trainers, PokemonLeague.Trainers.Trainer,
      join_through: "trainer_badge",
      on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(badge, attrs) do
    badge
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
