defmodule Hangman do
  
  use GenServer

  @server GameServer

  def make_move(game, guess) do
    GenServer.call(@server, { :move, game, guess })
  end
  def new_game() do
    GenServer.call(@server, { :new })
  end
  def new_game(word) do
    GenServer.call(@server, { :new, word })
  end
  def tally(game) do
    GenServer.call(@server, { :tally, game })
  end
  def start_link() do
    GenServer.start(Hangman.Server, [], name: @server)
  end

end
