defmodule Scoreboard.Repo.Migrations.CreateScores do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :current_score, :integer
      add :playing_first, :boolean, default: false, null: false
      add :score_to_chase, :integer
      add :match_id, references(:matches, on_delete: :nothing)

      timestamps()
    end

    create index(:scores, [:match_id])
  end
end
