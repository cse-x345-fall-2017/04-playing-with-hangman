defmodule Hangman.Server do

  def init([]) do
    { :ok, [] }
  end

  def handle_call({ :make_move, guess }, _from, state) do
    { next_state, next_tally } = Hangman.Game.make_move(state,guess)
    { :reply, { next_state, next_tally }, next_state }
  end

  def handle_call({ :tally }, _from, state) do
    { :reply, Hangman.Game.tally(state), state }
  end
  
  def handle_call({ :new_game }, _from, _state) do
    next_game = Hangman.Game.new_game()
    { :reply, next_game, next_game }
  end

  def handle_call({ :new_game, word }, _from, _state) do
    next_game = Hangman.Game.new_game(word)
    { :reply, next_game, next_game }
  end


end
