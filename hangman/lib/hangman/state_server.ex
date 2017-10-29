defmodule Hangman.StateServer do
  use GenServer

  def start_link() do 
    {:ok, _pid} = GenServer.start_link(__MODULE__, {})
  end
  
  def save_game(pid, game) do
    GenServer.cast pid, {:save_game, game}
  end

  def get_game(pid) do
    GenServer.call pid, :get_game
  end

  def handle_call(:get_game, _from, current_game) do
    {:reply, current_game, current_game}
  end

  def handle_cast({:save_game, game}, _current_game) do
    {:noreply, game}
  end
end