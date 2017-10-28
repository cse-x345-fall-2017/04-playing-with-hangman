defmodule Hangman do
  # alias Hangman.Game, as: Game
  
  @name Hangman
  use GenServer

  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: @name)
  end

  def make_move(_game, guess) do
    GenServer.call(@name, {:make_move, guess})
  end

  def new_game() do
    GenServer.call(@name, {:new_game})
  end

  def new_game(word) do
    GenServer.call(@name, {:new_game, word})
  end

  def tally(_game) do
    GenServer.call(@name, {:tally})
  end

  # defdelegate make_move(game, guess), to: Game
  # defdelegate new_game(),             to: Game
  # defdelegate new_game(word),         to: Game
  # defdelegate tally(game),            to: Game

end
