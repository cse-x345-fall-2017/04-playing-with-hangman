defmodule Hangman.Application do

  use Application

  def start(_type, _args) do
    
    import Supervisor.Spec, warn: false

    children = [
      #worker(Hangman.State, [] )

      worker(Hangman,  [] )
    ]

    opts = [
      strategy: :rest_for_one,
      restart: :permanent,
      name: Hangman.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
