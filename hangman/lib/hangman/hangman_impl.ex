defmodule Hangman.HangmanImpl do

  use GenServer

  alias Hangman.Game, as: Game

  @name Hangman.Impl

  def start_link() do
    GenServer.start __MODULE__, [], name: @name
  end

  def handle_call( :newGame, _from, state ) do
    { :reply, Game.new_game(), state }
  end

  def handle_call { :newGame, word }, _from, state do
    {:reply, Game.new_game( word ), state }
  end

  def handle_call { :make_move, game, guess }, _from, state  do
    { :reply, Game.make_move( game, guess ), state }
  end

  def handle_call { :tally, game }, _from, state do
    { :reply, Game.tally( game ), state }
  end

  def handle_cast { :crash, status }, state do
    { :stop, status, state }
  end

end