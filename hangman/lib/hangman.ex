defmodule Hangman do
  alias Hangman.Server
  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: Server
  defdelegate new_game(word),         to: Server
  defdelegate tally(game),            to: Server
  def start(_type,_args) do 
  import Supervisor.Spec, warn: false
  children=[
  worker(Hangman.Server,[])
  ]
  opts = [ strategy: :one_for_one]
  Supervisor.start_link(children,opts)
  end
end
