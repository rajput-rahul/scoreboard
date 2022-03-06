defmodule Scoreboard.MatchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scoreboard.Matches` context.
  """

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{
        country: "some country",
        ground: "some ground",
        name: "some name",
        winner: "some winner"
      })
      |> Scoreboard.Matches.create_match()

    match
  end

  @doc """
  Generate a score.
  """
  def score_fixture(attrs \\ %{}) do
    {:ok, score} =
      attrs
      |> Enum.into(%{
        current_score: 42,
        playing_first: true,
        score_to_chase: 42
      })
      |> Scoreboard.Matches.create_score()

    score
  end

  @doc """
  Generate a ball.
  """
  def ball_fixture(attrs \\ %{}) do
    {:ok, ball} =
      attrs
      |> Enum.into(%{
        ball_in_over: 42,
        ball_type: 42,
        desc: "some desc",
        game_ball: 42,
        over: 42,
        run_scored: 42
      })
      |> Scoreboard.Matches.create_ball()

    ball
  end
end
