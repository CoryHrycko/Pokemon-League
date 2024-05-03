defmodule PokemonLeagueWeb.TrainerBadgeController do
  use PokemonLeagueWeb, :controller

  alias PokemonLeague.TrainerBadges
  alias PokemonLeague.TrainerBadges.TrainerBadge

  def index(conn, _params) do
    trainer_badge = TrainerBadges.list_trainer_badge()
    render(conn, :index, trainer_badge_collection: trainer_badge)
  end

  def new(conn, _params) do
    changeset = TrainerBadges.change_trainer_badge(%TrainerBadge{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"trainer_badge" => trainer_badge_params}) do
    case TrainerBadges.create_trainer_badge(trainer_badge_params) do
      {:ok, trainer_badge} ->
        conn
        |> put_flash(:info, "Trainer badge created successfully.")
        |> redirect(to: ~p"/trainer_badge/#{trainer_badge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    trainer_badge = TrainerBadges.get_trainer_badge!(id)
    render(conn, :show, trainer_badge: trainer_badge)
  end

  def edit(conn, %{"id" => id}) do
    trainer_badge = TrainerBadges.get_trainer_badge!(id)
    changeset = TrainerBadges.change_trainer_badge(trainer_badge)
    render(conn, :edit, trainer_badge: trainer_badge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "trainer_badge" => trainer_badge_params}) do
    trainer_badge = TrainerBadges.get_trainer_badge!(id)

    case TrainerBadges.update_trainer_badge(trainer_badge, trainer_badge_params) do
      {:ok, trainer_badge} ->
        conn
        |> put_flash(:info, "Trainer badge updated successfully.")
        |> redirect(to: ~p"/trainer_badge/#{trainer_badge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, trainer_badge: trainer_badge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    trainer_badge = TrainerBadges.get_trainer_badge!(id)
    {:ok, _trainer_badge} = TrainerBadges.delete_trainer_badge(trainer_badge)

    conn
    |> put_flash(:info, "Trainer badge deleted successfully.")
    |> redirect(to: ~p"/trainer_badge")
  end
end
