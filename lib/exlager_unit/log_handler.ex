defmodule LagerUnit.LogHandler do
  use GenEvent

  #############
  # Callbacks #
  #############

  def handle_event({_,{_,_,_,_,_,_,msg}}, state) do
    alias LagerUnit.LogCapturer

    _ = List.to_string(msg) |> LogCapturer.capture()
    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end
end
