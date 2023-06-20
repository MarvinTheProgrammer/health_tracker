defmodule HealthTracker.ExercisesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HealthTracker.Exercises` context.
  """

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        equipment: ["option1", "option2"],
        video_link: "some video_link"
      })
      |> HealthTracker.Exercises.create_exercise()

    exercise
  end
end
