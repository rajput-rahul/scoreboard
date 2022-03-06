defmodule Scoreboard.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Teams.Player

  schema "teams" do
    field :country, :string
    field :dress_color, :string
    field :name, :string
    field :rank, :integer

    has_many :players, Player

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :country, :dress_color, :rank])
    |> validate_required([:name, :country, :dress_color, :rank])
  end
end
