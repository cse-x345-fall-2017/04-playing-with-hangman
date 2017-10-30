defmodule Hangman.Application do

  use Application

  def start(_type, args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Hangman.State, [args]),
      #worker(Hangman.Game, [args]),
      supervisor(Hangman.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
