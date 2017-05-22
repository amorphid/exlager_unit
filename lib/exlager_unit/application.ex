defmodule LagerUnit.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    alias LagerUnit.LogCapturer

    children = [
      worker(LogCapturer, [])
    ]

    opts = [strategy: :one_for_one, name: LagerUnit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
