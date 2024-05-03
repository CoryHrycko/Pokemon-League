defmodule PokemonLeagueWeb.TrainerBadgeControllerTest do
  use PokemonLeagueWeb.ConnCase

  import PokemonLeague.TrainerBadgesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all trainer_badge", %{conn: conn} do
      conn = get(conn, ~p"/trainer_badge")
      assert html_response(conn, 200) =~ "Listing Trainer badge"
    end
  end

  describe "new trainer_badge" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/trainer_badge/new")
      assert html_response(conn, 200) =~ "New Trainer badge"
    end
  end

  describe "create trainer_badge" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/trainer_badge", trainer_badge: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/trainer_badge/#{id}"

      conn = get(conn, ~p"/trainer_badge/#{id}")
      assert html_response(conn, 200) =~ "Trainer badge #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/trainer_badge", trainer_badge: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Trainer badge"
    end
  end

  describe "edit trainer_badge" do
    setup [:create_trainer_badge]

    test "renders form for editing chosen trainer_badge", %{conn: conn, trainer_badge: trainer_badge} do
      conn = get(conn, ~p"/trainer_badge/#{trainer_badge}/edit")
      assert html_response(conn, 200) =~ "Edit Trainer badge"
    end
  end

  describe "update trainer_badge" do
    setup [:create_trainer_badge]

    test "redirects when data is valid", %{conn: conn, trainer_badge: trainer_badge} do
      conn = put(conn, ~p"/trainer_badge/#{trainer_badge}", trainer_badge: @update_attrs)
      assert redirected_to(conn) == ~p"/trainer_badge/#{trainer_badge}"

      conn = get(conn, ~p"/trainer_badge/#{trainer_badge}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, trainer_badge: trainer_badge} do
      conn = put(conn, ~p"/trainer_badge/#{trainer_badge}", trainer_badge: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Trainer badge"
    end
  end

  describe "delete trainer_badge" do
    setup [:create_trainer_badge]

    test "deletes chosen trainer_badge", %{conn: conn, trainer_badge: trainer_badge} do
      conn = delete(conn, ~p"/trainer_badge/#{trainer_badge}")
      assert redirected_to(conn) == ~p"/trainer_badge"

      assert_error_sent 404, fn ->
        get(conn, ~p"/trainer_badge/#{trainer_badge}")
      end
    end
  end

  defp create_trainer_badge(_) do
    trainer_badge = trainer_badge_fixture()
    %{trainer_badge: trainer_badge}
  end
end
