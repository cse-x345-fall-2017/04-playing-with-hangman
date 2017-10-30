defmodule Hangman.Server do
  use GenServer

  alias Hangman.Game

  ### API ###
  def start_link() do
     GenServer.start_link(Hangman, nil, name: Hangman)
   end

  def new_game() do
    GenServer.call(Hangman, {:new_game})
  end

  def new_game(word) do
    GenServer.call(Hangman, {:new_game, word})
  end

  def tally(game) do
    GenServer.call(Hangman, {:tally, game})
  end

  def make_move(game, guess) do
    GenServer.call(Hangman, {:make_move, game, guess})
  end

  ### Handle Server Calls ###
  def handle_call({:new_game, word}, _from, state) do
    {:reply, Game.new_game(word), state}
  end

  def handle_call(:new_game, _from, state) do
    {:reply, Game.new_game(), state}
  end

  def handle_call({:tally, game}, _from, state) do
    tally = Game.tally(game)
    {:reply, tally, state}
  end

  def handle_call({:make_move, game, guess}, _from, state) do
    move = Game.make_move(game, guess)
    {:reply, move, state}
  end


end
