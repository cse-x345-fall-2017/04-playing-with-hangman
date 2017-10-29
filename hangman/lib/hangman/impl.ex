defmodule Hangman.Impl do

  @name Hangman.Server

  def new_game() do
    GenServer.call(@name, :new_game)
  end

  def new_game(word) do
    GenServer.call(@name, { :new_game, word })
  end

  def make_move(game, guess) do
    GenServer.call(@name, { :make_move, game, guess })
  end

  def tally(game) do
    GenServer.call(@name, { :tally, game })
  end

end
