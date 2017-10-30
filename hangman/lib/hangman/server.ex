defmodule Hangman.Server do

  def handle_call({ :tally, game }, _from, _state) do
    { :reply,
    Hangman.Game.tally( game ),
    0 }
  end

  def handle_call({ :move, game, guess }, _from, _state) do
    { :reply,
     Hangman.Game.make_move( game, guess),
     0 }
  end

  def handle_call({ :new }, _from, _state) do
    { :reply,
    Hangman.Game.new_game,
    0 }
  end

  def handle_call({ :new, word }, _from, _state) do
    { :reply,
    Hangman.Game.new_game( word ),
    0 }
  end

  def init(_args) do
    { :ok, 0 }
  end
  
  
end