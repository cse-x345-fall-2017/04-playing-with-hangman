defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Hangman.Supervisor, [])
    ]
    opts = [ strategy: :one_for_one ]
    Hangman.Interface.start_link()
    Supervisor.start_link(children, opts)

  end

end
