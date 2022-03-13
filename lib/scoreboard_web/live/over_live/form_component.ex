defmodule ScoreboardWeb.OverLive.FormComponent do
  use ScoreboardWeb, :live_component

  alias Scoreboard.Matches

  @impl true
  def update(%{ball: ball} = assigns, socket) do
    changeset = Matches.change_ball(ball)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ball" => ball_params}, socket) do
    changeset =
      socket.assigns.ball
      |> Matches.change_ball(ball_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ball" => ball_params}, socket) do
    save_ball(socket, socket.assigns.action, ball_params)
  end

  defp save_ball(socket, :edit, ball_params) do
    case Matches.update_ball(socket.assigns.ball, ball_params) do
      {:ok, _ball} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ball updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ball(socket, :new, ball_params) do
    case Matches.create_ball(ball_params) do
      {:ok, _ball} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ball created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
