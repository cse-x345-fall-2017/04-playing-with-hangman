defmodule Hangman.Server do

  alias Hangman.Game, as: Game
  use GenServer
  @name Hangman.Server

  def start_link() do
    GenServer.start_link(@name, [], name: @name)
  end

  def new_game() do
    GenServer.call(@name, :new_game)
  end


  def new_game(word) do
    GenServer.call(@name, { :new_game, word })
  end

  def make_move(game, guess) do
    GenServer.call(@name, { :make_move, game, guess })
  end

  def tally(game) do
    GenServer.call(@name, { :tally, game })
  end


  ######Implementation######
  def handle_call(:new_game, _from, state) do
    { :reply, Game.new_game(), state }
  end

  def handle_call({ :new_game, word }, _from, state) do
    { :reply, Game.new_game(word), state }
  end

  def handle_call({ :make_move, game, guess }, _from, state) do
    { :reply, Game.make_move(game, guess), state }
  end

  def handle_call({ :tally, game }, _from, state) do
    { :reply, Game.tally(game), state }
  end


end
