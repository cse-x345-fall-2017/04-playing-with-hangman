defmodule Hangman.Application do

  use Application

  def start(_type, args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Hangman.Server, args, restart: :transient)
    ]

    opts = [strategy: :one_for_one, name: Hangman.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
