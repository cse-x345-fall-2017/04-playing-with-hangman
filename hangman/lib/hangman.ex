defmodule Hangman do
  
  @server HangmanServer

  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: @server)
  end
  
  def make_move(_game, guess) do
    GenServer.call(@server, { :guess, guess })
  end
  
  def new_game() do
    GenServer.call(@server, { :new })
  end
  
  def new_game(word) do
    GenServer.call(@server, { :new, word })
  end
  
  def tally(_game) do
    GenServer.call(@server, { :tally })
  end
  
end
