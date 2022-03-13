defmodule BallLive.BallComponent do
  use Phoenix.Component

  # Optionally also bring the HTML helpers
  # use Phoenix.HTML

  def ball(assigns) do
    ~H"""
    <div class="grid grid-cols-12 py-2">
      <div class="col-span-1">
        <%= assigns.ball.over.number %>.<%= assigns.ball.number %>
      </div>
      <div class="col-span-1 flex justify-center">
        <div class="flex w-6 h-6 rounded-full border border-gray-300 justify-center">
          <div class="self-center text-xs">
            <%= assigns.ball.runs %>
          </div>
        </div>
      </div>
      <div class="col-span-10">
        <div class="flex justify-start">
          <%= assigns.ball.desc %>
        </div>
      </div>
    </div>
    """
  end
end
