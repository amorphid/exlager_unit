defmodule LagerUnit.LogCapturer do
  use GenServer

  #######
  # API #
  #######

  def capture(msg) do
    GenServer.cast(__MODULE__, {:capture, msg})
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  #############
  # Callbacks #
  #############

  def handle_cast({:capture, msg}, state) do
    # TODO: handle messages
    {:noreply, state}
  end

  def init(_) do
    state = %{}
    {:ok, state}
  end
end
