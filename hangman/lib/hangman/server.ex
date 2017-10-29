defmodule Hangman.Server do
  alias Hangman.Game, as: Game

  use GenServer

   def init(args \\ []) do
      { :ok, args }
   end

    def handle_call({ :new_game }, _from, _state ) do
       { :reply, Game.new_game(), Game.new_game() }
    end

    def handle_call({ :new_game, word }, _from, _state ) do
       { :reply, Game.new_game(word), Game.new_game(word) }
    end

    def handle_call({ :tally, game }, _from, state ) do
       { :reply, Game.tally(game), state }
    end

   def handle_call({ :make_move, guess }, _from, state ) do
      {updated_state, tally} = Game.make_move( state, guess )
      { :reply, {updated_state, tally}, updated_state }
   end

   def handle_cast({ :crash, reason }, state ) do
      { :stop, reason, state } 
   end

end
