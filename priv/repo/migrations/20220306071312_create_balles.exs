defmodule Scoreboard.Repo.Migrations.Createballs do
  use Ecto.Migration

  def change do
    create table(:balls) do
      add :over, :integer
      add :ball_in_over, :integer
      add :game_ball, :integer
      add :ball_type, :integer
      add :desc, :string
      add :run_scored, :integer
      add :match_id, references(:matches, on_delete: :nothing)

      timestamps()
    end

    create index(:balls, [:match_id])
  end
end
