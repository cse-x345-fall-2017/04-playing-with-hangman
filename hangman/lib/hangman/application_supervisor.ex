defmodule Hangman.Application_Supervisor do
  use Application

  def start_link do
    import Supervisor.Spec, warn: false

    children = [
      worker(Hangman.Server, [])
    ]

    settings = [
      strategy: :one_for_one,
      name: Hangman.Server,
      restart: :permanent
    ]

    {:ok, pid} = Supervisor.start_link(children, settings)
  end

end
