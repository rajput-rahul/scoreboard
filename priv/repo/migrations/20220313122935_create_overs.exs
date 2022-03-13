defmodule Scoreboard.Repo.Migrations.CreateOvers do
  use Ecto.Migration

  def change do
    create table(:overs) do
      add :number, :integer
      add :powerplay_active, :boolean, default: false, null: false
      add :finished, :boolean, default: false, null: false
      add :powerplay_type, :string
      add :ball_thrown, :integer
      add :run_scored, :integer
      add :fours, :integer
      add :sixes, :integer
      add :wickets, :integer
      add :wides, :integer
      add :no_balls, :integer
      add :hattricks, :integer
      add :match_id, references(:matches, on_delete: :delete_all)

      timestamps()
    end

    create index(:overs, [:match_id])

    drop_if_exists table(:balls)

    create table(:balls) do
      add :number, :integer
      add :wicket, :boolean, default: false, null: false
      add :boundary, :boolean, default: false, null: false
      add :type, :string
      add :runs, :integer
      add :desc, :string
      add :boundary_type, :string
      add :over_id, references(:overs, on_delete: :delete_all)

      timestamps()
    end

    create index(:balls, [:over_id])
  end
end
