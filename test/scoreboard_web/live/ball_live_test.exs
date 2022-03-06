defmodule ScoreboardWeb.BallLiveTest do
  use ScoreboardWeb.ConnCase

  import Phoenix.LiveViewTest
  import Scoreboard.MatchesFixtures

  @create_attrs %{
    ball_in_over: 42,
    ball_type: 42,
    desc: "some desc",
    game_ball: 42,
    over: 42,
    run_scored: 42
  }
  @update_attrs %{
    ball_in_over: 43,
    ball_type: 43,
    desc: "some updated desc",
    game_ball: 43,
    over: 43,
    run_scored: 43
  }
  @invalid_attrs %{
    ball_in_over: nil,
    ball_type: nil,
    desc: nil,
    game_ball: nil,
    over: nil,
    run_scored: nil
  }

  defp create_ball(_) do
    ball = ball_fixture()
    %{ball: ball}
  end

  describe "Index" do
    setup [:create_ball]

    test "lists all balls", %{conn: conn, ball: ball} do
      {:ok, _index_live, html} = live(conn, Routes.ball_index_path(conn, :index))

      assert html =~ "Listing balls"
      assert html =~ ball.desc
    end

    test "saves new ball", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ball_index_path(conn, :index))

      assert index_live |> element("a", "New Ball") |> render_click() =~
               "New Ball"

      assert_patch(index_live, Routes.ball_index_path(conn, :new))

      assert index_live
             |> form("#ball-form", ball: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ball-form", ball: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ball_index_path(conn, :index))

      assert html =~ "Ball created successfully"
      assert html =~ "some desc"
    end

    test "updates ball in listing", %{conn: conn, ball: ball} do
      {:ok, index_live, _html} = live(conn, Routes.ball_index_path(conn, :index))

      assert index_live |> element("#ball-#{ball.id} a", "Edit") |> render_click() =~
               "Edit Ball"

      assert_patch(index_live, Routes.ball_index_path(conn, :edit, ball))

      assert index_live
             |> form("#ball-form", ball: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ball-form", ball: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ball_index_path(conn, :index))

      assert html =~ "Ball updated successfully"
      assert html =~ "some updated desc"
    end

    test "deletes ball in listing", %{conn: conn, ball: ball} do
      {:ok, index_live, _html} = live(conn, Routes.ball_index_path(conn, :index))

      assert index_live |> element("#ball-#{ball.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ball-#{ball.id}")
    end
  end

  describe "Show" do
    setup [:create_ball]

    test "displays ball", %{conn: conn, ball: ball} do
      {:ok, _show_live, html} = live(conn, Routes.ball_show_path(conn, :show, ball))

      assert html =~ "Show Ball"
      assert html =~ ball.desc
    end

    test "updates ball within modal", %{conn: conn, ball: ball} do
      {:ok, show_live, _html} = live(conn, Routes.ball_show_path(conn, :show, ball))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ball"

      assert_patch(show_live, Routes.ball_show_path(conn, :edit, ball))

      assert show_live
             |> form("#ball-form", ball: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ball-form", ball: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ball_show_path(conn, :show, ball))

      assert html =~ "Ball updated successfully"
      assert html =~ "some updated desc"
    end
  end
end
