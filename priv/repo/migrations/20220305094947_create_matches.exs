defmodule Scoreboard.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :name, :string
      add :country, :string
      add :ground, :string
      add :winner, :string
      add :team1_id, references(:teams, on_delete: :nothing)
      add :team2_id, references(:teams, on_delete: :nothing)

      timestamps()
    end

    create index(:matches, [:team1_id])
    create index(:matches, [:team2_id])
  end
end
