defmodule LagerUnit.LogCapturer do
  use GenServer

  #######
  # API #
  #######

  def capture(msg) do
    GenServer.cast(__MODULE__, {:capture, msg})
  end

  def register_test() do
    test = self()
    GenServer.call(__MODULE__, {:register_test, test})
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  #############
  # Callbacks #
  #############

  def handle_call({:register_test, test}, _from, state) do
    _ = Process.monitor(test)
    new_state = MapSet.put(state, test)
    {:reply, :ok, new_state}
  end

  def handle_cast({:capture, msg}, state) do
    _ = Enum.map(state, fn pid -> send(pid, msg) end)
    {:noreply, state}
  end

  def handle_info(.{:DOWN, _ref, :process, pid, :shutdown}, state) do
    new_state = MapSet.delete(pid)
    {:noreply, new_state}
  end

  def init(_) do
    state = MapSet.new()
    {:ok, state}
  end
end
