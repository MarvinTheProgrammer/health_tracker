defmodule HealthTracker.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :equipment, {:array, :string}
      add :description, :text
      add :video_link, :string

      timestamps()
    end
  end
end
