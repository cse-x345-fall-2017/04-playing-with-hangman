defmodule Hangman.Server do
  use GenServer
  alias Hangman.Game, as: Game



  def init ([]) do
    { :ok, Game.new_game() }
  end                             # End of init

  def handle_call({ :new_game }, _from, _state) do
    newgame = Game.new_game()
    { :reply, newgame, newgame }
  end                             # End of hand_call for new_game without init_word



  def handle_call({ :new_game, word }, _from, _state) do
    newgame = Game.new_game(word)
    { :reply, newgame, newgame }
  end                             # End of hand_call for new_game with init_word



  def handle_call({ :make_move, guess }, _from, state) do
    {state, tally} = Game.make_move(state, guess)
    { :reply, { state, tally }, state }
  end                             # End of hand_call for make_move




  def handle_call({ :tally }, _from, state) do
    { :reply, Game.tally(state), state  }
  end                             # End of hand_call for tally




end                               # End of Server

