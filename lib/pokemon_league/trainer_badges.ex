defmodule PokemonLeague.TrainerBadges do
  @moduledoc """
  The TrainerBadges context.
  """

  import Ecto.Query, warn: false
  alias PokemonLeague.Repo

  alias PokemonLeague.TrainerBadges.TrainerBadge

  @doc """
  Returns the list of trainer_badge.

  ## Examples

      iex> list_trainer_badge()
      [%TrainerBadge{}, ...]

  """
  def list_trainer_badge do
    Repo.all(TrainerBadge)
  end

  @doc """
  Gets a single trainer_badge.

  Raises `Ecto.NoResultsError` if the Trainer badge does not exist.

  ## Examples

      iex> get_trainer_badge!(123)
      %TrainerBadge{}

      iex> get_trainer_badge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trainer_badge!(id), do: Repo.get!(TrainerBadge, id)

  @doc """
  Creates a trainer_badge.

  ## Examples

      iex> create_trainer_badge(%{field: value})
      {:ok, %TrainerBadge{}}

      iex> create_trainer_badge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trainer_badge(attrs \\ %{}) do
    %TrainerBadge{}
    |> TrainerBadge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trainer_badge.

  ## Examples

      iex> update_trainer_badge(trainer_badge, %{field: new_value})
      {:ok, %TrainerBadge{}}

      iex> update_trainer_badge(trainer_badge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trainer_badge(%TrainerBadge{} = trainer_badge, attrs) do
    trainer_badge
    |> TrainerBadge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trainer_badge.

  ## Examples

      iex> delete_trainer_badge(trainer_badge)
      {:ok, %TrainerBadge{}}

      iex> delete_trainer_badge(trainer_badge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trainer_badge(%TrainerBadge{} = trainer_badge) do
    Repo.delete(trainer_badge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trainer_badge changes.

  ## Examples

      iex> change_trainer_badge(trainer_badge)
      %Ecto.Changeset{data: %TrainerBadge{}}

  """
  def change_trainer_badge(%TrainerBadge{} = trainer_badge, attrs \\ %{}) do
    TrainerBadge.changeset(trainer_badge, attrs)
  end
end
