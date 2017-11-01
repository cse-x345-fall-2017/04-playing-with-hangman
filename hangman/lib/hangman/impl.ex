defmodule Hangman.Impl do

  @server HangmanGame

  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: @server)
  end
  
  def make_move(game, guess) do
    GenServer.cast(@server, { :make_move, game, guess })
  end
  
  def new_game() do
    GenServer.call(@server, { :new_game })
  end

  def new_game(word) do
    GenServer.call(@server, { :new_game, word })
  end

  def tally(game) do
    GenServer.call(@server, { :tally, game })
  end

end
