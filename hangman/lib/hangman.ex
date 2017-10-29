defmodule Hangman do
  use Application
  
  alias Hangman.GameListener
  alias Hangman.GameServer
  alias Hangman.GameSup
  
  defdelegate new_game(),             to: GameSup
  defdelegate new_game(word),         to: GameSup
  defdelegate make_move(game, guess), to: GameServer
  defdelegate tally(game),            to: GameServer

  def start(_type, _args) do
    GameListener.start_link()
    GameSup.start_link()
  end
  
end
