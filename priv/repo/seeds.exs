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

{:ok, o1} =
  Matches.create_over(%{
    number: 1,
    match_id: m1.id,
    finished: true
  })

  {:ok, o2} =
    Matches.create_over(%{
      number: 2,
      match_id: m1.id
    })

{:ok, _} = Matches.create_ball(%{
  number: 1,
  over_id: o1.id,
  desc: "Simply covered the ball",
  runs: 0
})

{:ok, _} = Matches.create_ball(%{
  number: 2,
  over_id: o1.id,
  desc: "Loft of to six, and it's huge six",
  runs: 6
})

{:ok, _} = Matches.create_ball(%{
  number: 3,
  over_id: o1.id,
  desc: "Ball goes directly to Four, another boundary",
  runs: 4
})

{:ok, _} = Matches.create_ball(%{
  number: 4,
  over_id: o1.id,
  desc: "Yorker ball direct to pads, it's appeal to umpire.",
  runs: 0
})
{:ok, _} = Matches.create_ball(%{
  number: 5,
  over_id: o1.id,
  desc: "Virat just defended it.",
  runs: 0
})
{:ok, _} = Matches.create_ball(%{
  number: 6,
  over_id: o1.id,
  desc: "Wide ball",
  runs: 1,
  type: :wide
})

{:ok, _} = Matches.create_ball(%{
  number: 6,
  over_id: o1.id,
  desc: "Another Boundary, bravo Virat",
  runs: 4
})
{:ok, _} = Matches.create_ball(%{
  number: 1,
  over_id: o2.id,
  desc: "Another Boundary by Rohit, Wow he is following Virat",
  runs: 4
})
