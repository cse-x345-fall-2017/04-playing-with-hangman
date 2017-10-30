defmodule Hangman.Client do
  
  def new_game() do
    GenServer.call(Hangman, {:new_game})
  end
  def new_game(word) do
    GenServer.call(Hangman, {:new_game, word})
  end

  def tally(game) do
    GenServer.call(Hangman, {:tally, game})
  end

  def make_move(game, guess) do
    GenServer.call(Hangman, {:make_move, game, guess})
  end
end
