defmodule Hangman.Server do

  alias Hangman.Game, as: Game

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  ######Implementation######
  def handle_call(:new_game, _from, state) do
    { :reply, Game.new_game(), state }
  end

  def handle_call({ :new_game, word }, _from, state) do
    { :reply, Game.new_game(word), state }
  end

  def handle_call({ :make_move, game, guess }, _from, state) do
    { :reply, Game.make_move(game, guess), state }
  end

  def handle_call({ :tally, game }, _from, state) do
    { :reply, Game.tally(game), state }
  end
  
end
