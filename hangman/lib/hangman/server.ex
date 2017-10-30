defmodule Hangman.Server do
  use GenServer

  def init(default \\ []) do
    { :ok, default }
  end

  def handle_call({ :make_move, game, guess }, _from, state) do
    result = Hangman.Game.make_move( game, guess )
    { :reply, result, state }
  end

  def handle_call({ :new_game }, _from, state ) do
    { :reply, Hangman.Game.new_game(), state }
  end

  def handle_call({ :new_game, word }, _from, state ) do
    { :reply, Hangman.Game.new_game(word), state } 
  end
  
  def handle_call({ :tally, game }, _from, state ) do
    { :reply, Hangman.Game.tally(game), state }
  end
end
