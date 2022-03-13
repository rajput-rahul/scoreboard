defmodule Scoreboard.Matches.Over do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Matches.{Match, Ball}

  schema "overs" do
    field :ball_thrown, :integer, default: 0
    field :fours, :integer, default: 0
    field :hattricks, :integer, default: 0
    field :no_balls, :integer, default: 0
    field :number, :integer
    field :powerplay_active, :boolean, default: false
    field :powerplay_type, Ecto.Enum, values: [:no_powerplay, :bowling, :batting], default: :no_powerplay
    field :run_scored, :integer, default: 0
    field :sixes, :integer, default: 0
    field :wickets, :integer, default: 0
    field :wides, :integer, default: 0
    belongs_to :match, Match

    has_many :balls, Ball

    timestamps()
  end

  @doc false
  def changeset(over, attrs) do
    over
    |> cast(attrs, [:number, :powerplay_active, :powerplay_type, :ball_thrown, :run_scored, :fours, :sixes, :wickets, :wides, :no_balls, :hattricks, :match_id])
    |> validate_required([:number, :powerplay_active, :powerplay_type, :ball_thrown, :run_scored, :fours, :sixes, :wickets, :wides, :no_balls, :hattricks, :match_id])
  end
end
