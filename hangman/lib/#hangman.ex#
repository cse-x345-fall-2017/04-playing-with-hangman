defmodule Hangman do
  alias Hangman.GameClient as : GameClient  	 
  
  defdelegate make_move(game, guess), to: GameClient
  defdelegate new_game(),             to: GameClient
  defdelegate new_game(word),         to: GameClient
  defdelegate tally(game),            to: GameClient

  def start_link() do
      GenServer.start_link(Hangman.Server, [], name: Hangman)
  end
end
