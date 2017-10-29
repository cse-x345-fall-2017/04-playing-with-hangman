defmodule Hangman.Application do
  use Application

  def start(_type, args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Hangman.Supervisor, args)
    ]
    
    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end