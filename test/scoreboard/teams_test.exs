defmodule Scoreboard.TeamsTest do
  use Scoreboard.DataCase

  alias Scoreboard.Teams

  describe "players" do
    alias Scoreboard.Teams.Player

    import Scoreboard.TeamsFixtures

    @invalid_attrs %{age: nil, bio: nil, country: nil, first_name: nil, last_name: nil, type: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Teams.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Teams.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{age: 42, bio: "some bio", country: "some country", first_name: "some first_name", last_name: "some last_name", type: 42}

      assert {:ok, %Player{} = player} = Teams.create_player(valid_attrs)
      assert player.age == 42
      assert player.bio == "some bio"
      assert player.country == "some country"
      assert player.first_name == "some first_name"
      assert player.last_name == "some last_name"
      assert player.type == 42
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{age: 43, bio: "some updated bio", country: "some updated country", first_name: "some updated first_name", last_name: "some updated last_name", type: 43}

      assert {:ok, %Player{} = player} = Teams.update_player(player, update_attrs)
      assert player.age == 43
      assert player.bio == "some updated bio"
      assert player.country == "some updated country"
      assert player.first_name == "some updated first_name"
      assert player.last_name == "some updated last_name"
      assert player.type == 43
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_player(player, @invalid_attrs)
      assert player == Teams.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Teams.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Teams.change_player(player)
    end
  end

  describe "teams" do
    alias Scoreboard.Teams.Team

    import Scoreboard.TeamsFixtures

    @invalid_attrs %{country: nil, dress_color: nil, name: nil, rank: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{country: "some country", dress_color: "some dress_color", name: "some name", rank: 42}

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.country == "some country"
      assert team.dress_color == "some dress_color"
      assert team.name == "some name"
      assert team.rank == 42
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{country: "some updated country", dress_color: "some updated dress_color", name: "some updated name", rank: 43}

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.country == "some updated country"
      assert team.dress_color == "some updated dress_color"
      assert team.name == "some updated name"
      assert team.rank == 43
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end
end
