defmodule PokemonLeague.Trainers do
  @moduledoc """
  The Trainers context.
  """

  import Ecto.Query, warn: false
  alias PokemonLeague.Repo

  alias PokemonLeague.Trainers.Trainer

  @doc """
  Returns the list of trainers.

  ## Examples

      iex> list_trainers()
      [%Trainer{}, ...]

  """
  def list_trainers do
    Repo.all(Trainer)
    |> Repo.preload(:badges)
  end

  @doc """
  Gets a single trainer.

  Raises `Ecto.NoResultsError` if the Trainer does not exist.

  ## Examples

      iex> get_trainer!(123)
      %Trainer{}

      iex> get_trainer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trainer!(id) do
    Repo.get!(Trainer, id)
    |> Repo.preload(:badges)
  end

  def list_badges(trainer) do
    trainer
    |> Repo.preload(:badges)
    |> Map.get(:badges)
    |> Enum.map(& &1.name)
  end


  @doc """
  Creates a trainer.

  ## Examples

      iex> create_trainer(%{field: value})
      {:ok, %Trainer{}}

      iex> create_trainer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trainer(attrs \\ %{}) do
    %Trainer{}
    |> Trainer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trainer.

  ## Examples

      iex> update_trainer(trainer, %{field: new_value})
      {:ok, %Trainer{}}

      iex> update_trainer(trainer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trainer(%Trainer{} = trainer, attrs) do
    trainer
    |> Trainer.changeset(attrs)
    |> Repo.preload(:badges)
    |> Repo.update()
  end

  @doc """
  Deletes a trainer.

  ## Examples

      iex> delete_trainer(trainer)
      {:ok, %Trainer{}}

      iex> delete_trainer(trainer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trainer(%Trainer{} = trainer) do
    Repo.delete(trainer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trainer changes.

  ## Examples

      iex> change_trainer(trainer)
      %Ecto.Changeset{data: %Trainer{}}

  """
  def change_trainer(%Trainer{} = trainer, attrs \\ %{}) do
    Trainer.changeset(trainer, attrs)
  end
end
