defmodule Hangman.GameServer do
  use GenServer
  
  alias Hangman.Game
  @name :game_server
  
  
  # === Public API =========================================================== #
  
  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: :game_server)
  end
  
  def new_game() do
    GenServer.call(@name, :new_game)
  end
  
  def new_game(word) do
    GenServer.call(@name, {:new_game, word})
  end
  
  def make_move(game, guess) do
    GenServer.call(@name, {:make_move, game, guess})
  end
  
  def tally(game) do
    GenServer.call(@name, {:tally, game})
  end
  
  
  # === GenServer Implementation ============================================= #
  
  def handle_call(:new_game, _from, state) do
    {:reply, Game.new_game(), state}
  end
  
  def handle_call({:new_game, word}, _from, state) do
    {:reply, Game.new_game(word), state}
  end
  
  def handle_call({:make_move, game, guess}, _from, state) do
    result = Game.make_move(game, guess)
    {:reply, result, state}
  end
  
  def handle_call({:tally, game}, _from, state) do
    {:reply, Game.tally(game), state}
  end
  
end
