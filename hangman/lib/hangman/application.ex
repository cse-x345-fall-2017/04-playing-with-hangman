defmodule Hangman.Application do

  use Application

  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    children = [
      worker(Hangman.Server, [], restart:  :transient)
    ]
    opts = [ strategy: :one_for_one,
             name:     Hangman.Supervisor ]

    { :ok, _pid } = Supervisor.start_link(children, opts)

  end

end
