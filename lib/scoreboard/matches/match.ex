defmodule Scoreboard.Matches.Match do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Teams.Team
  alias Scoreboard.Matches.Ball

  schema "matches" do
    field :country, :string
    field :ground, :string
    field :name, :string
    field :winner, :string
    belongs_to :team1, Team
    belongs_to :team2, Team

    has_many :balls, Ball

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:name, :country, :ground, :winner, :team1_id, :team2_id])
    |> validate_required([:name, :country, :ground, :team1_id, :team2_id])
  end
end
