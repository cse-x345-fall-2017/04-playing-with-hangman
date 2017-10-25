defmodule Hangman do
  alias Hangman.Server, as: Server
  
  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: Server
  defdelegate new_game(word),         to: Server
  defdelegate tally(game),            to: Server

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Server, [])
    ]
    opts = [ strategy: :one_for_one,
             name:     Hangman.Supervisor,
             restart:  :transient ]

    Supervisor.start_link(children, opts)

  end

end
