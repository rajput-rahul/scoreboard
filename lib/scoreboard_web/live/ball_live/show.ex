defmodule ScoreboardWeb.BallLive.Show do
  use ScoreboardWeb, :live_view

  alias Scoreboard.Matches

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ball, Matches.get_ball!(id))}
  end

  defp page_title(:show), do: "Show Ball"
  defp page_title(:edit), do: "Edit Ball"
end
