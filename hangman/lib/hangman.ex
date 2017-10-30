defmodule Hangman do

  @name __MODULE__

  def start_link do
    GenServer.start_link( Hangman.Server, [], name: @name )
  end

  def make_move(game, guess) do
    GenServer.call(@name, { :make_move, game, guess })
  end

  def new_game() do
    GenServer.call(@name, { :new_game })
  end

  def new_game(word) do
    GenServer.call(@name, { :new_game, word })
  end

  def tally(game) do
    GenServer.call(@name, { :tally, game })
  end

  #defdelegate make_move(game, guess), to: Game
  #defdelegate new_game(),             to: Game
  #defdelegate new_game(word),         to: Game
  #defdelegate tally(game),            to: Game

end
