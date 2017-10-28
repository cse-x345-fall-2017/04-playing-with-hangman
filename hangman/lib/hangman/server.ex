defmodule Hangman.Server do
  use GenServer

  def init([]) do
    { :ok, Hangman.Game.new_game() }
  end

  def init(args) do
    { :ok, Hangman.Game.new_game(args) }
  end

  def handle_call({ :guess, value }, _from,  state) do
    { state, tally } = Hangman.Game.make_move(state, value)
    { :reply, {state, tally}, state }
  end

  def handle_call({ :tally }, _from, state) do
    { :reply, Hangman.Game.tally(state), state }
  end

  def handle_call({ :new }, _from, _state) do
    new_state = Hangman.Game.new_game()
    { :reply, new_state, new_state }
  end

  def handle_call({ :new, word}, _from, _state) do
    new_state = Hangman.Game.new_game(word)
    { :reply, new_state, new_state }
  end
  
end
