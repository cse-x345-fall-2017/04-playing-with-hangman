defmodule Hangman do
  use Application
  
  alias Hangman.GameServer
  
  defdelegate make_move(game, guess), to: GameServer
  defdelegate new_game(),             to: GameServer
  defdelegate new_game(word),         to: GameServer
  defdelegate tally(game),            to: GameServer

  def start(_type, _args) do
    Hangman.GameSup.start_link()
  end
  
end
