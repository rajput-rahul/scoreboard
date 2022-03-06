defmodule Scoreboard.Teams.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scoreboard.Teams.Team

  schema "players" do
    field :age, :integer
    field :bio, :string
    field :country, :string
    field :first_name, :string
    field :last_name, :string
    field :type, :integer

    belongs_to :team, Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:first_name, :last_name, :age, :type, :country, :bio, :team_id])
    |> validate_required([:first_name, :last_name, :age, :type, :country, :bio, :team_id])
  end
end
