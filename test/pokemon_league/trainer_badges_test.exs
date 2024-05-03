defmodule PokemonLeague.TrainerBadgesTest do
  use PokemonLeague.DataCase

  alias PokemonLeague.TrainerBadges

  describe "trainer_badge" do
    alias PokemonLeague.TrainerBadges.TrainerBadge

    import PokemonLeague.TrainerBadgesFixtures

    @invalid_attrs %{}

    test "list_trainer_badge/0 returns all trainer_badge" do
      trainer_badge = trainer_badge_fixture()
      assert TrainerBadges.list_trainer_badge() == [trainer_badge]
    end

    test "get_trainer_badge!/1 returns the trainer_badge with given id" do
      trainer_badge = trainer_badge_fixture()
      assert TrainerBadges.get_trainer_badge!(trainer_badge.id) == trainer_badge
    end

    test "create_trainer_badge/1 with valid data creates a trainer_badge" do
      valid_attrs = %{}

      assert {:ok, %TrainerBadge{} = trainer_badge} = TrainerBadges.create_trainer_badge(valid_attrs)
    end

    test "create_trainer_badge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TrainerBadges.create_trainer_badge(@invalid_attrs)
    end

    test "update_trainer_badge/2 with valid data updates the trainer_badge" do
      trainer_badge = trainer_badge_fixture()
      update_attrs = %{}

      assert {:ok, %TrainerBadge{} = trainer_badge} = TrainerBadges.update_trainer_badge(trainer_badge, update_attrs)
    end

    test "update_trainer_badge/2 with invalid data returns error changeset" do
      trainer_badge = trainer_badge_fixture()
      assert {:error, %Ecto.Changeset{}} = TrainerBadges.update_trainer_badge(trainer_badge, @invalid_attrs)
      assert trainer_badge == TrainerBadges.get_trainer_badge!(trainer_badge.id)
    end

    test "delete_trainer_badge/1 deletes the trainer_badge" do
      trainer_badge = trainer_badge_fixture()
      assert {:ok, %TrainerBadge{}} = TrainerBadges.delete_trainer_badge(trainer_badge)
      assert_raise Ecto.NoResultsError, fn -> TrainerBadges.get_trainer_badge!(trainer_badge.id) end
    end

    test "change_trainer_badge/1 returns a trainer_badge changeset" do
      trainer_badge = trainer_badge_fixture()
      assert %Ecto.Changeset{} = TrainerBadges.change_trainer_badge(trainer_badge)
    end
  end
end
