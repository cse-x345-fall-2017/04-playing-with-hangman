defmodule Hangman.Connector do
  def child_spec(_arg) do
    %{
      id: Connector,
      start: {__MODULE__, :start_link, []},
      restart: :transient
    }
  end
  
  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default)
  end

  def make_move(game, guess) do
    GenServer.call(game, { :guess, guess })
  end

  def tally(game) do
    GenServer.call(game, { :tally })
  end

end
