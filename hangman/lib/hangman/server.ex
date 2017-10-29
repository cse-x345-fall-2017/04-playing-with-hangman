defmodule Hangman.Server do

  use GenServer
 
  def init(args \\ []) do
    { :ok, args }
  end

  def handle_call({ :new }, _from, _state) do
    new_state = Hangman.Game.new_game()
    { :reply, new_state, new_state }
  end

  def handle_call({ :new, word }, _from, _state) do
    new_state = Hangman.Game.new_game(word)
    { :reply, new_state, new_state }
  end
 
  def handle_call({ :make_move, value }, _from, state) do
    { new_state, tally } = Hangman.Game.make_move(state, value)
    { :reply, {new_state, tally}, new_state }
  end
 
  def handle_call({ :tally, game }, _from, state) do
    { :reply, Hangman.Game.tally(game), state }
  end
 


end