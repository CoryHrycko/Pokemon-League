defmodule PokemonLeagueWeb.TrainerControllerTest do
  use PokemonLeagueWeb.ConnCase

  import PokemonLeague.TrainersFixtures

  @create_attrs %{name: "some name", age: 42, badges: ["option1", "option2"], pokemon: ["option1", "option2"]}
  @update_attrs %{name: "some updated name", age: 43, badges: ["option1"], pokemon: ["option1"]}
  @invalid_attrs %{name: nil, age: nil, badges: nil, pokemon: nil}

  describe "index" do
    test "lists all trainers", %{conn: conn} do
      conn = get(conn, ~p"/trainers")
      assert html_response(conn, 200) =~ "Listing Trainers"
    end
  end

  describe "new trainer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/trainers/new")
      assert html_response(conn, 200) =~ "New Trainer"
    end
  end

  describe "create trainer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/trainers", trainer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/trainers/#{id}"

      conn = get(conn, ~p"/trainers/#{id}")
      assert html_response(conn, 200) =~ "Trainer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/trainers", trainer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Trainer"
    end
  end

  describe "edit trainer" do
    setup [:create_trainer]

    test "renders form for editing chosen trainer", %{conn: conn, trainer: trainer} do
      conn = get(conn, ~p"/trainers/#{trainer}/edit")
      assert html_response(conn, 200) =~ "Edit Trainer"
    end
  end

  describe "update trainer" do
    setup [:create_trainer]

    test "redirects when data is valid", %{conn: conn, trainer: trainer} do
      conn = put(conn, ~p"/trainers/#{trainer}", trainer: @update_attrs)
      assert redirected_to(conn) == ~p"/trainers/#{trainer}"

      conn = get(conn, ~p"/trainers/#{trainer}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, trainer: trainer} do
      conn = put(conn, ~p"/trainers/#{trainer}", trainer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Trainer"
    end
  end

  describe "delete trainer" do
    setup [:create_trainer]

    test "deletes chosen trainer", %{conn: conn, trainer: trainer} do
      conn = delete(conn, ~p"/trainers/#{trainer}")
      assert redirected_to(conn) == ~p"/trainers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/trainers/#{trainer}")
      end
    end
  end

  defp create_trainer(_) do
    trainer = trainer_fixture()
    %{trainer: trainer}
  end
end
