defmodule Hangman.DataStore do
  use GenServer

  @store __MODULE__

  def start_link do
    Agent.start_link(fn -> 0 end, name: @store)
  end

end
