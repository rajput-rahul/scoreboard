defmodule Scoreboard.Matches.Ball do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Matches.Over

  schema "balls" do
    field :number, :integer
    field :type, Ecto.Enum, values: [:normal, :wide, :no, :leg_by], default: :normal
    field :desc, :string
    field :runs, :integer
    field :wicket, :boolean, default: false
    field :boundary, :boolean, default: false
    field :boundary_type, Ecto.Enum, values: [:no_boundary, :six, :four], default: :no_boundary

    belongs_to :over, Over

    timestamps()
  end

  @doc false
  def changeset(ball, attrs) do
    ball
    |> cast(attrs, [:over_id, :number, :type, :desc, :runs, :wicket, :boundary, :boundary_type])
    |> validate_required([:over_id, :number, :type, :desc, :runs, :wicket, :boundary, :boundary_type])
  end
end
