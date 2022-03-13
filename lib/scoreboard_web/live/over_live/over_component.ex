defmodule ScoreboardWeb.OverLive.OverComponent do
  use Phoenix.Component

  # Optionally also bring the HTML helpers
  # use Phoenix.HTML

  def over(assigns) do
    ~H"""
    <%= if assigns.over.finished do %>
    <div class="bg-gray-500 text-white p-1">
      END OF OVER: 10 | 20 Run | IND: 100/1
    </div>
    <div class="grid grid-cols-2 divide-x-2 border-b-2">
      <div class="grid grid-rows-2">
        <div class="w-full columns-2">
          <div class="px-4">
            Virat Kohli
          </div>
          <div class=" flex px-4 justify-end">
            0 (5b)
          </div>
        </div>
        <div class="w-full columns-2">
          <div class="px-4">
            Rohit Sharma
          </div>
          <div class=" flex px-4 justify-end">
            10 (5b)
          </div>
        </div>
      </div>
      <div class="grid grid-rows-2">
        <div class="w-full columns-2">
          <div class="px-4">
            Shoaib Akhtar
          </div>
          <div class="flex px-4 justify-end">
            7-3-5-8
          </div>
        </div>
        <div class="w-full columns-2">
          <div class="px-4">
            Mohd. Najim
          </div>
          <div class="flex px-4 justify-end">
            17-3-15-8
          </div>
        </div>
      </div>
    </div>
    <% end %>
    <div id="discussions" class="">
    </div>
    <div class="grid divide-y">
      <%= for ball <- assigns.over.balls do %>
        <OverLive.BallComponent.ball ball={ball}/>
      <% end %>
    </div>
    """
  end
end
