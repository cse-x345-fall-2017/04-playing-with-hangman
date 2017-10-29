defmodule Hangman.Client_API do 

  def start_link() do
    GenServer.start_link(Hangman.Server, [], name: HangmanServer)
  end

  def new_game() do
    GenServer.call(HangmanServer, :new_game)
  end

  def new_game(word) do
    GenServer.call(HangmanServer, {:new_game, word})
  end

  def make_move(game, guess) do
    GenServer.call(HangmanServer, {:make_move, game, guess})
  end

  def tally(game) do
    GenServer.call(HangmanServer, {:tally, game})
  end
  
end