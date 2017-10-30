defmodule Hangman.Server do
  use GenServer

  def init(args) do
    { :ok, Enum.into(args, %{}) }
  end
  
  def handle_cast({ :make_move, game, guess }, state) do
    { :noreply, Hangman.Game.make_move(game, guess), state }
  end

  def handle_call({ :new_game }, _from, state) do
    { :reply, Hangman.Game.new_game(), state }
  end
  
  def handle_call({ :new_game, word }, _from, state) do
    { :reply, Hangman.Game.new_game(word), state }
  end

  def handle_call({ :tally, game }, _from, state) do
    { :reply, Hangman.Game.tally(game), state }
  end

end
