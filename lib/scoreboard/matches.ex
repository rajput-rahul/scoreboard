defmodule Scoreboard.Matches do
  @moduledoc """
  The Matches context.
  """

  import Ecto.Query, warn: false
  alias Scoreboard.Repo

  alias Scoreboard.Matches.{Match, Over, Ball, Score}

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end

  @doc """
  Returns the list of scores.

  ## Examples

      iex> list_scores()
      [%Score{}, ...]

  """
  def list_scores do
    Repo.all(Score)
  end

  @doc """
  Gets a single score.

  Raises `Ecto.NoResultsError` if the Score does not exist.

  ## Examples

      iex> get_score!(123)
      %Score{}

      iex> get_score!(456)
      ** (Ecto.NoResultsError)

  """
  def get_score!(id), do: Repo.get!(Score, id)

  @doc """
  Creates a score.

  ## Examples

      iex> create_score(%{field: value})
      {:ok, %Score{}}

      iex> create_score(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_score(attrs \\ %{}) do
    %Score{}
    |> Score.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a score.

  ## Examples

      iex> update_score(score, %{field: new_value})
      {:ok, %Score{}}

      iex> update_score(score, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_score(%Score{} = score, attrs) do
    score
    |> Score.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a score.

  ## Examples

      iex> delete_score(score)
      {:ok, %Score{}}

      iex> delete_score(score)
      {:error, %Ecto.Changeset{}}

  """
  def delete_score(%Score{} = score) do
    Repo.delete(score)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking score changes.

  ## Examples

      iex> change_score(score)
      %Ecto.Changeset{data: %Score{}}

  """
  def change_score(%Score{} = score, attrs \\ %{}) do
    Score.changeset(score, attrs)
  end

  @doc """
  Returns the list of balls.

  ## Examples

      iex> list_balls()
      [%Ball{}, ...]

  """
  def list_balls_with_over do
    Repo.all(from b in Ball, order_by: {:desc, b.id}, preload: :over)
  end

  @doc """
  Gets a single ball.

  Raises `Ecto.NoResultsError` if the Ball does not exist.

  ## Examples

      iex> get_ball!(123)
      %Ball{}

      iex> get_ball!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ball!(id), do: Repo.get!(Ball, id)

  @doc """
  Creates a ball.

  ## Examples

      iex> create_ball(%{field: value})
      {:ok, %Ball{}}

      iex> create_ball(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ball(attrs \\ %{}) do
    %Ball{}
    |> Ball.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:ball_created)
  end

  @doc """
  Updates a ball.

  ## Examples

      iex> update_ball(ball, %{field: new_value})
      {:ok, %Ball{}}

      iex> update_ball(ball, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ball(%Ball{} = ball, attrs) do
    ball
    |> Ball.changeset(attrs)
    |> Repo.update()
    |> broadcast(:ball_updated)
  end

  @doc """
  Deletes a ball.

  ## Examples

      iex> delete_ball(ball)
      {:ok, %Ball{}}

      iex> delete_ball(ball)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ball(%Ball{} = ball) do
    Repo.delete(ball)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ball changes.

  ## Examples

      iex> change_ball(ball)
      %Ecto.Changeset{data: %Ball{}}

  """
  def change_ball(%Ball{} = ball, attrs \\ %{}) do
    Ball.changeset(ball, attrs)
  end

  def create_over(attrs \\ %{}) do
    %Over{}
    |> Over.changeset(attrs)
    |> Repo.insert()
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Scoreboard.PubSub, "balls")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, ball}, event) do
    Phoenix.PubSub.broadcast(Scoreboard.PubSub, "balls", {event, ball})
    {:ok, ball}
  end
end
