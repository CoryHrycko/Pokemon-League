defmodule PokemonLeagueWeb.BadgeController do
  use PokemonLeagueWeb, :controller

  alias PokemonLeague.Badges
  alias PokemonLeague.Badges.Badge

  def index(conn, _params) do
    badges = Badges.list_badges()
    render(conn, :index, badges: badges)
  end

  def new(conn, _params) do
    changeset = Badges.change_badge(%Badge{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"badge" => badge_params}) do
    case Badges.create_badge(badge_params) do
      {:ok, badge} ->
        conn
        |> put_flash(:info, "Badge created successfully.")
        |> redirect(to: ~p"/badges/#{badge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    badge = Badges.get_badge!(id)
    render(conn, :show, badge: badge)
  end

  def edit(conn, %{"id" => id}) do
    badge = Badges.get_badge!(id)
    changeset = Badges.change_badge(badge)
    render(conn, :edit, badge: badge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "badge" => badge_params}) do
    badge = Badges.get_badge!(id)

    case Badges.update_badge(badge, badge_params) do
      {:ok, badge} ->
        conn
        |> put_flash(:info, "Badge updated successfully.")
        |> redirect(to: ~p"/badges/#{badge}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, badge: badge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    badge = Badges.get_badge!(id)
    {:ok, _badge} = Badges.delete_badge(badge)

    conn
    |> put_flash(:info, "Badge deleted successfully.")
    |> redirect(to: ~p"/badges")
  end
end
