defmodule Hangman do

  @hangmanApp :hangmanApp

  def start_link(args \\ [%{}]) do
  	GenServer.start_link(Hangman.Server, args, name: @hangmanApp)
  end

  def make_move(game, guess) do
  	GenServer.call(@hangmanApp, { :make_move, game, guess })
  end
  
  def new_game() do
  	GenServer.call(@hangmanApp, { :new_game })
  end

  def new_game(word) do
  	GenServer.call(@hangmanApp, { :new_game, word })
  end

  def tally(game) do
  	GenServer.call(@hangmanApp, { :tally, game })
  end

  def crash(reason) do
  	GenServer.cast(@hangmanApp, { :crash, reason })
  end

end
