defmodule Scoreboard.Matches.Ball do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Matches.Match

  schema "balls" do
    field :ball_in_over, :integer
    field :ball_type, :integer
    field :desc, :string
    field :game_ball, :integer
    field :over, :integer
    field :run_scored, :integer

    belongs_to :match, Match

    timestamps()
  end

  @doc false
  def changeset(ball, attrs) do
    ball
    |> cast(attrs, [:over, :ball_in_over, :game_ball, :ball_type, :desc, :run_scored, :match_id])
    |> validate_required([:over, :ball_in_over, :game_ball, :ball_type, :desc, :run_scored])
  end
end
