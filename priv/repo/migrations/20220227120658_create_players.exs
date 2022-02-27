defmodule Scoreboard.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
      add :type, :integer
      add :country, :string
      add :bio, :string
      add :team_id, references(:teams, on_delete: :nothing)

      timestamps()
    end
  end
end
