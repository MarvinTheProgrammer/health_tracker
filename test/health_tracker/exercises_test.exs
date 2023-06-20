defmodule HealthTracker.ExercisesTest do
  use HealthTracker.DataCase

  alias HealthTracker.Exercises

  describe "exercises" do
    alias HealthTracker.Exercises.Exercise

    import HealthTracker.ExercisesFixtures

    @invalid_attrs %{name: nil, description: nil, equipment: nil, video_link: nil}

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Exercises.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Exercises.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{name: "some name", description: "some description", equipment: ["option1", "option2"], video_link: "some video_link"}

      assert {:ok, %Exercise{} = exercise} = Exercises.create_exercise(valid_attrs)
      assert exercise.name == "some name"
      assert exercise.description == "some description"
      assert exercise.equipment == ["option1", "option2"]
      assert exercise.video_link == "some video_link"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", equipment: ["option1"], video_link: "some updated video_link"}

      assert {:ok, %Exercise{} = exercise} = Exercises.update_exercise(exercise, update_attrs)
      assert exercise.name == "some updated name"
      assert exercise.description == "some updated description"
      assert exercise.equipment == ["option1"]
      assert exercise.video_link == "some updated video_link"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Exercises.update_exercise(exercise, @invalid_attrs)
      assert exercise == Exercises.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Exercises.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Exercises.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Exercises.change_exercise(exercise)
    end
  end
end
