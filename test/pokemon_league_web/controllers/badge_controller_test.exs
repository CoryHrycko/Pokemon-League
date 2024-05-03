defmodule PokemonLeagueWeb.BadgeControllerTest do
  use PokemonLeagueWeb.ConnCase

  import PokemonLeague.BadgesFixtures

  @create_attrs %{name: "some name", type: 42}
  @update_attrs %{name: "some updated name", type: 43}
  @invalid_attrs %{name: nil, type: nil}

  describe "index" do
    test "lists all badges", %{conn: conn} do
      conn = get(conn, ~p"/badges")
      assert html_response(conn, 200) =~ "Listing Badges"
    end
  end

  describe "new badge" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/badges/new")
      assert html_response(conn, 200) =~ "New Badge"
    end
  end

  describe "create badge" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/badges", badge: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/badges/#{id}"

      conn = get(conn, ~p"/badges/#{id}")
      assert html_response(conn, 200) =~ "Badge #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/badges", badge: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Badge"
    end
  end

  describe "edit badge" do
    setup [:create_badge]

    test "renders form for editing chosen badge", %{conn: conn, badge: badge} do
      conn = get(conn, ~p"/badges/#{badge}/edit")
      assert html_response(conn, 200) =~ "Edit Badge"
    end
  end

  describe "update badge" do
    setup [:create_badge]

    test "redirects when data is valid", %{conn: conn, badge: badge} do
      conn = put(conn, ~p"/badges/#{badge}", badge: @update_attrs)
      assert redirected_to(conn) == ~p"/badges/#{badge}"

      conn = get(conn, ~p"/badges/#{badge}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, badge: badge} do
      conn = put(conn, ~p"/badges/#{badge}", badge: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Badge"
    end
  end

  describe "delete badge" do
    setup [:create_badge]

    test "deletes chosen badge", %{conn: conn, badge: badge} do
      conn = delete(conn, ~p"/badges/#{badge}")
      assert redirected_to(conn) == ~p"/badges"

      assert_error_sent 404, fn ->
        get(conn, ~p"/badges/#{badge}")
      end
    end
  end

  defp create_badge(_) do
    badge = badge_fixture()
    %{badge: badge}
  end
end
