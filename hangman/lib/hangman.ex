defmodule Hangman do
  alias Hangman.Server, as: Server

  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: Server
  defdelegate new_game(word),         to: Server
  defdelegate tally(game),            to: Server

  def start(_type, _args) do
    Hangman.Application_Supervisor.start_link()
  end

end
