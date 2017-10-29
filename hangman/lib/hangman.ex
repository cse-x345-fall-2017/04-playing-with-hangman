defmodule Hangman do

  use GenServer
  
  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: __MODULE__)
  end

  def new_game() do
    GenServer.call(__MODULE__, {:new_game})
  end

  def new_game(word) do
    GenServer.call(__MODULE__, {:new_game, word})
  end

  def make_move(_game, guess) do
    GenServer.call(__MODULE__, {:make_move, guess})
  end
  
  def tally(game) do
    GenServer.call(__MODULE__, {:tally, game})
  end

end
