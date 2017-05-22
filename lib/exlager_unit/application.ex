defmodule LagerUnit.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    alias LagerUnit.LogCapturer
    alias LagerUnit.LogHandler

    children = [
      worker(LogCapturer, []),
    ]    

    opts = [strategy: :one_for_one, name: LagerUnit.Supervisor]

    case Supervisor.start_link(children, opts) do
      {:ok, _pid} = start ->
        :ok = GenEvent.add_handler(:lager_event, LogHandler, [])
        start
    end
  end
end
