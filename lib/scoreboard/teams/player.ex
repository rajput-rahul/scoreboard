defmodule Scoreboard.Teams.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :age, :integer
    field :bio, :string
    field :country, :string
    field :first_name, :string
    field :last_name, :string
    field :type, :integer
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:first_name, :last_name, :age, :type, :country, :bio])
    |> validate_required([:first_name, :last_name, :age, :type, :country, :bio])
  end
end
