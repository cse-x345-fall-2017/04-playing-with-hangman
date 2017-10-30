defmodule Hangman.Server do

  #########################
  # Server Implementation #
  #########################
  
  use GenServer, restart: :transient

  def init(_args) do
    { :ok, []}
  end

  def handle_call({ :make_move, game, guess }, _from, state) do
    { :reply, Hangman.Impl.make_move(game,guess), state}
  end

  def handle_call({ :new_game }, _from, state) do
    { :reply, Hangman.Impl.new_game(), state }
  end
  
  def handle_call({ :new_game, word }, _from, state) do
    { :reply, Hangman.Impl.new_game(word), state }
  end

  def handle_call({ :tally, game }, _from, state) do
    { :reply, Hangman.Impl.tally(game), state }
  end

  def handle_cast({ :crash, reason }, state) do
    { :stop, reason, state}
  end

end