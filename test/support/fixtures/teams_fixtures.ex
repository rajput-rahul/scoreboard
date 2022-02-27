defmodule Scoreboard.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scoreboard.Teams` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        age: 42,
        bio: "some bio",
        country: "some country",
        first_name: "some first_name",
        last_name: "some last_name",
        type: 42
      })
      |> Scoreboard.Teams.create_player()

    player
  end
end
