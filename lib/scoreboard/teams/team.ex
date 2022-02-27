defmodule Scoreboard.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :country, :string
    field :dress_color, :string
    field :name, :string
    field :rank, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :country, :dress_color, :rank])
    |> validate_required([:name, :country, :dress_color, :rank])
  end
end
