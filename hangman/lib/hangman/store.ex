defmodule Hangman.Store do
  use GenServer

  def start_link do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

end
