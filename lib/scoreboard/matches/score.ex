defmodule Scoreboard.Matches.Score do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Matches.Match

  schema "scores" do
    field :current_score, :integer
    field :playing_first, :boolean, default: false
    field :score_to_chase, :integer

    belongs_to :match, Match

    timestamps()
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:current_score, :playing_first, :score_to_chase, :match_id])
    |> validate_required([:current_score, :playing_first, :score_to_chase])
  end
end
