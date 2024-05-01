defmodule PokemonLeague.TrainersTest do
  use PokemonLeague.DataCase

  alias PokemonLeague.Trainers

  describe "trainers" do
    alias PokemonLeague.Trainers.Trainer

    import PokemonLeague.TrainersFixtures

    @invalid_attrs %{name: nil, age: nil, badges: nil, pokemon: nil}

    test "list_trainers/0 returns all trainers" do
      trainer = trainer_fixture()
      assert Trainers.list_trainers() == [trainer]
    end

    test "get_trainer!/1 returns the trainer with given id" do
      trainer = trainer_fixture()
      assert Trainers.get_trainer!(trainer.id) == trainer
    end

    test "create_trainer/1 with valid data creates a trainer" do
      valid_attrs = %{name: "some name", age: 42, badges: ["option1", "option2"], pokemon: ["option1", "option2"]}

      assert {:ok, %Trainer{} = trainer} = Trainers.create_trainer(valid_attrs)
      assert trainer.name == "some name"
      assert trainer.age == 42
      assert trainer.badges == ["option1", "option2"]
      assert trainer.pokemon == ["option1", "option2"]
    end

    test "create_trainer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trainers.create_trainer(@invalid_attrs)
    end

    test "update_trainer/2 with valid data updates the trainer" do
      trainer = trainer_fixture()
      update_attrs = %{name: "some updated name", age: 43, badges: ["option1"], pokemon: ["option1"]}

      assert {:ok, %Trainer{} = trainer} = Trainers.update_trainer(trainer, update_attrs)
      assert trainer.name == "some updated name"
      assert trainer.age == 43
      assert trainer.badges == ["option1"]
      assert trainer.pokemon == ["option1"]
    end

    test "update_trainer/2 with invalid data returns error changeset" do
      trainer = trainer_fixture()
      assert {:error, %Ecto.Changeset{}} = Trainers.update_trainer(trainer, @invalid_attrs)
      assert trainer == Trainers.get_trainer!(trainer.id)
    end

    test "delete_trainer/1 deletes the trainer" do
      trainer = trainer_fixture()
      assert {:ok, %Trainer{}} = Trainers.delete_trainer(trainer)
      assert_raise Ecto.NoResultsError, fn -> Trainers.get_trainer!(trainer.id) end
    end

    test "change_trainer/1 returns a trainer changeset" do
      trainer = trainer_fixture()
      assert %Ecto.Changeset{} = Trainers.change_trainer(trainer)
    end
  end
end
