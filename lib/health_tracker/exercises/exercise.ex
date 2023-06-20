defmodule HealthTracker.Exercises.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :name, :string
    field :description, :string
    field :equipment, {:array, :string}
    field :video_link, :string

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :equipment, :description, :video_link])
    |> validate_required([:name, :equipment, :description, :video_link])
  end
end
