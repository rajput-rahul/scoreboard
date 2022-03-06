# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Scoreboard.Repo.insert!(%Scoreboard.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Scoreboard.{Matches, Teams}

{:ok, t1} = Teams.create_team(%{name: "India", country: "India", rank: 1, dress_color: "Blue"})

{:ok, t2} =
  Teams.create_team(%{name: "Pakistan", country: "Pakistan", rank: 2, dress_color: "Green"})

{:ok, _p1} =
  Teams.create_player(%{
    first_name: "Virat",
    last_name: "Kohli",
    age: 34,
    country: "India",
    bio: "Captain",
    team_id: t1.id,
    type: 1
  })

{:ok, _p2} =
  Teams.create_player(%{
    first_name: "Rohit",
    last_name: "Sharma",
    age: 32,
    country: "India",
    bio: "Hitman",
    team_id: t1.id,
    type: 1
  })

{:ok, _p3} =
  Teams.create_player(%{
    first_name: "Jaspreet",
    last_name: "Bumrah",
    age: 28,
    country: "India",
    bio: "Pacer",
    team_id: t1.id,
    type: 2
  })

{:ok, _p4} =
  Teams.create_player(%{
    first_name: "Shoiab",
    last_name: "Malik",
    age: 26,
    country: "Pakistan",
    bio: "Good Player",
    team_id: t2.id,
    type: 1
  })

{:ok, _p5} =
  Teams.create_player(%{
    first_name: "Shoiab",
    last_name: "Akhtar",
    age: 36,
    country: "Pakistan",
    bio: "Rawalpindi Express",
    team_id: t2.id,
    type: 2
  })

{:ok, _p6} =
  Teams.create_player(%{
    first_name: "Babar",
    last_name: "Azam",
    age: 36,
    country: "Pakistan",
    bio: "Captain",
    team_id: t2.id,
    type: 1
  })

{:ok, m1} =
    Matches.create_match(%{
      country: "India",
      ground: "Green park",
      name: "Match 1",
      winner: "",
      team1_id: t1.id,
      team2_id: t2.id
    })

    {:ok, _b1} = Matches.create_ball(%{
      ball_in_over: 1,
      over: 1,
      game_ball: 1,
      desc: "Simple covered the ball",
      run_scored: 0,
      ball_type: 1,
      match_id: m1.id
    })
