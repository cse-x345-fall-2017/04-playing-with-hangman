defmodule Hangman.GameServer do
  use GenServer
  
  alias Hangman.Game
  
  
  # === Public API =========================================================== #
  
  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end
  
  def new_game(pid) do
    GenServer.call(pid, :new_game)
  end
  
  def new_game(pid, word) do
    GenServer.call(pid, {:new_game, word})
  end
  
  def make_move(pid, guess) do
    GenServer.call(pid, {:make_move, guess})
  end
  
  def tally(pid) do
    GenServer.call(pid, :tally)
  end
  
  
  # === GenServer Implementation ============================================= #
  
  def handle_call(:new_game, _from, _) do
    new_state = Game.new_game()
    {:reply, self(), new_state}
  end
  
  def handle_call({:new_game, word}, _from, _) do
    new_state = Game.new_game(word)
    {:reply, self(), new_state}
  end
  
  def handle_call({:make_move, guess}, _from, state) do
    {new_state, tally} = Game.make_move(state, guess)
    {:reply, {self(), tally}, new_state}
  end
  
  def handle_call(:tally, _from, state) do
    {:reply, Game.tally(state), state}
  end
  
end
