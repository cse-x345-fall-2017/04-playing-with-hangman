defmodule Hangman do

  def start_link do
    GenServer.start_link(Hangman.Server, [], name: __MODULE__)
  end

  def make_move(game, guess) do
    GenServer.call(__MODULE__, {:make_move, game, guess})
  end


  def new_game do
    GenServer.call(__MODULE__, {:new_game})
  end

  def new_game(word) do
    GenServer.call(__MODULE__, {:new_game, word})
  end


  def tally(game) do
    GenServer.call(__MODULE__, {:tally, game})
  end

end
