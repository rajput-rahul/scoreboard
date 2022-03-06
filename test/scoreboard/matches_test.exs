defmodule Scoreboard.MatchesTest do
  use Scoreboard.DataCase

  alias Scoreboard.Matches

  describe "matches" do
    alias Scoreboard.Matches.Match

    import Scoreboard.MatchesFixtures

    @invalid_attrs %{country: nil, ground: nil, name: nil, winner: nil}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Matches.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Matches.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{
        country: "some country",
        ground: "some ground",
        name: "some name",
        winner: "some winner"
      }

      assert {:ok, %Match{} = match} = Matches.create_match(valid_attrs)
      assert match.country == "some country"
      assert match.ground == "some ground"
      assert match.name == "some name"
      assert match.winner == "some winner"
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()

      update_attrs = %{
        country: "some updated country",
        ground: "some updated ground",
        name: "some updated name",
        winner: "some updated winner"
      }

      assert {:ok, %Match{} = match} = Matches.update_match(match, update_attrs)
      assert match.country == "some updated country"
      assert match.ground == "some updated ground"
      assert match.name == "some updated name"
      assert match.winner == "some updated winner"
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_match(match, @invalid_attrs)
      assert match == Matches.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Matches.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Matches.change_match(match)
    end
  end

  describe "scores" do
    alias Scoreboard.Matches.Score

    import Scoreboard.MatchesFixtures

    @invalid_attrs %{current_score: nil, playing_first: nil, score_to_chase: nil}

    test "list_scores/0 returns all scores" do
      score = score_fixture()
      assert Matches.list_scores() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert Matches.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      valid_attrs = %{current_score: 42, playing_first: true, score_to_chase: 42}

      assert {:ok, %Score{} = score} = Matches.create_score(valid_attrs)
      assert score.current_score == 42
      assert score.playing_first == true
      assert score.score_to_chase == 42
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      update_attrs = %{current_score: 43, playing_first: false, score_to_chase: 43}

      assert {:ok, %Score{} = score} = Matches.update_score(score, update_attrs)
      assert score.current_score == 43
      assert score.playing_first == false
      assert score.score_to_chase == 43
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_score(score, @invalid_attrs)
      assert score == Matches.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = Matches.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = Matches.change_score(score)
    end
  end

  describe "balls" do
    alias Scoreboard.Matches.Ball

    import Scoreboard.MatchesFixtures

    @invalid_attrs %{
      ball_in_over: nil,
      ball_type: nil,
      desc: nil,
      game_ball: nil,
      over: nil,
      run_scored: nil
    }

    test "list_balls/0 returns all balls" do
      ball = ball_fixture()
      assert Matches.list_balls() == [ball]
    end

    test "get_ball!/1 returns the ball with given id" do
      ball = ball_fixture()
      assert Matches.get_ball!(ball.id) == ball
    end

    test "create_ball/1 with valid data creates a ball" do
      valid_attrs = %{
        ball_in_over: 42,
        ball_type: 42,
        desc: "some desc",
        game_ball: 42,
        over: 42,
        run_scored: 42
      }

      assert {:ok, %Ball{} = ball} = Matches.create_ball(valid_attrs)
      assert ball.ball_in_over == 42
      assert ball.ball_type == 42
      assert ball.desc == "some desc"
      assert ball.game_ball == 42
      assert ball.over == 42
      assert ball.run_scored == 42
    end

    test "create_ball/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_ball(@invalid_attrs)
    end

    test "update_ball/2 with valid data updates the ball" do
      ball = ball_fixture()

      update_attrs = %{
        ball_in_over: 43,
        ball_type: 43,
        desc: "some updated desc",
        game_ball: 43,
        over: 43,
        run_scored: 43
      }

      assert {:ok, %Ball{} = ball} = Matches.update_ball(ball, update_attrs)
      assert ball.ball_in_over == 43
      assert ball.ball_type == 43
      assert ball.desc == "some updated desc"
      assert ball.game_ball == 43
      assert ball.over == 43
      assert ball.run_scored == 43
    end

    test "update_ball/2 with invalid data returns error changeset" do
      ball = ball_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_ball(ball, @invalid_attrs)
      assert ball == Matches.get_ball!(ball.id)
    end

    test "delete_ball/1 deletes the ball" do
      ball = ball_fixture()
      assert {:ok, %Ball{}} = Matches.delete_ball(ball)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_ball!(ball.id) end
    end

    test "change_ball/1 returns a ball changeset" do
      ball = ball_fixture()
      assert %Ecto.Changeset{} = Matches.change_ball(ball)
    end
  end
end
