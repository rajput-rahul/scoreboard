defmodule Scoreboard.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :country, :string
      add :dress_color, :string
      add :rank, :integer

      timestamps()
    end
  end
end
