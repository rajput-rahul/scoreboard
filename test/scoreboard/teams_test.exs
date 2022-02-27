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
end
