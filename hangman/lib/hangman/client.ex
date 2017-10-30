defmodule Hangman.Client do

  def new_game(word) do
    GenServer.call(Hangman.Server, { :new_game, word })
  end

  def new_game() do
    GenServer.call(Hangman.Server, :new_game)
  end

  def make_move(game, guess) do
    GenServer.call(Hangman.Server, { :make_move, game, guess })
  end

  def tally(game) do
    GenServer.call(Hangman.Server, { :tally, game })
  end

end
