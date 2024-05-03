defmodule PokemonLeague.BadgesTest do
  use PokemonLeague.DataCase

  alias PokemonLeague.Badges

  describe "badges" do
    alias PokemonLeague.Badges.Badge

    import PokemonLeague.BadgesFixtures

    @invalid_attrs %{name: nil, type: nil}

    test "list_badges/0 returns all badges" do
      badge = badge_fixture()
      assert Badges.list_badges() == [badge]
    end

    test "get_badge!/1 returns the badge with given id" do
      badge = badge_fixture()
      assert Badges.get_badge!(badge.id) == badge
    end

    test "create_badge/1 with valid data creates a badge" do
      valid_attrs = %{name: "some name", type: 42}

      assert {:ok, %Badge{} = badge} = Badges.create_badge(valid_attrs)
      assert badge.name == "some name"
      assert badge.type == 42
    end

    test "create_badge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Badges.create_badge(@invalid_attrs)
    end

    test "update_badge/2 with valid data updates the badge" do
      badge = badge_fixture()
      update_attrs = %{name: "some updated name", type: 43}

      assert {:ok, %Badge{} = badge} = Badges.update_badge(badge, update_attrs)
      assert badge.name == "some updated name"
      assert badge.type == 43
    end

    test "update_badge/2 with invalid data returns error changeset" do
      badge = badge_fixture()
      assert {:error, %Ecto.Changeset{}} = Badges.update_badge(badge, @invalid_attrs)
      assert badge == Badges.get_badge!(badge.id)
    end

    test "delete_badge/1 deletes the badge" do
      badge = badge_fixture()
      assert {:ok, %Badge{}} = Badges.delete_badge(badge)
      assert_raise Ecto.NoResultsError, fn -> Badges.get_badge!(badge.id) end
    end

    test "change_badge/1 returns a badge changeset" do
      badge = badge_fixture()
      assert %Ecto.Changeset{} = Badges.change_badge(badge)
    end
  end
end
