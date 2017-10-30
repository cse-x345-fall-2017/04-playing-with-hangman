defmodule Hangman.HangmanServerImpl do
  @name Hangman.Impl

  # implementation

  def new_game() do
    GenServer.call @name, :newGame
  end

  def new_game( state ) do
    GenServer.call @name, { :newGame, state }
  end

  def make_move( game, guess ) do
    GenServer.call @name, { :make_move, game, guess }
  end

  def tally( game ) do
    GenServer.call @name, { :tally, game }
  end

  def crash( status ) do
    GenServer.cast @name, { :crash, status }
  end


end
