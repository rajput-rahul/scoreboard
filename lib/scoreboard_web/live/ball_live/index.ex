defmodule ScoreboardWeb.BallLive.Index do
  use ScoreboardWeb, :live_view

  alias Scoreboard.Matches
  alias Scoreboard.Matches.Ball

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Matches.subscribe()
    {:ok, assign(socket, :balls, list_balls())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ball")
    |> assign(:ball, Matches.get_ball!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ball")
    |> assign(:ball, %Ball{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing balls")
    |> assign(:ball, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ball = Matches.get_ball!(id)
    {:ok, _} = Matches.delete_ball(ball)

    {:noreply, assign(socket, :balls, list_balls())}
  end

  @impl true
  def handle_info({_, ball}, socket) do
    {:noreply, update(socket, :balls, fn balls -> [ball | balls] end)}
  end

  defp list_balls do
    Matches.list_balls()
  end
end
