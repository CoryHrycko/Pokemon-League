defmodule PokemonLeagueWeb.TrainerController do
  use PokemonLeagueWeb, :controller

  alias PokemonLeague.Trainers
  alias PokemonLeague.Trainers.Trainer

  def index(conn, _params) do
    trainers = Trainers.list_trainers()
    render(conn, :index, trainers: trainers)
  end

  def new(conn, _params) do
    changeset = Trainers.change_trainer(%Trainer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"trainer" => trainer_params}) do
    case Trainers.create_trainer(trainer_params) do
      {:ok, trainer} ->
        conn
        |> put_flash(:info, "Trainer created successfully.")
        |> redirect(to: ~p"/trainers/#{trainer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    trainer = Trainers.get_trainer!(id)
    render(conn, :show, trainer: trainer)
  end

  def edit(conn, %{"id" => id}) do
    trainer = Trainers.get_trainer!(id)
    changeset = Trainers.change_trainer(trainer)
    render(conn, :edit, trainer: trainer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "trainer" => trainer_params}) do
    trainer = Trainers.get_trainer!(id)

    case Trainers.update_trainer(trainer, trainer_params) do
      {:ok, trainer} ->
        conn
        |> put_flash(:info, "Trainer updated successfully.")
        |> redirect(to: ~p"/trainers/#{trainer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, trainer: trainer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    trainer = Trainers.get_trainer!(id)
    {:ok, _trainer} = Trainers.delete_trainer(trainer)

    conn
    |> put_flash(:info, "Trainer deleted successfully.")
    |> redirect(to: ~p"/trainers")
  end
end
