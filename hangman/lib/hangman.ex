defmodule Hangman do

  @server HangmanGame

  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: @server)
  end

  def new_game() do
    GenServer.call(@server, { :new_game })
  end

  def new_game(word) do
    GenServer.call(@server, { :new_game, word })
  end

  def make_move(_game, guess) do
    GenServer.call(@server, { :make_move, guess })
  end
 
  def tally(game) do
    GenServer.call(@server, { :tally, game })
  end

  def crash(reason) do
    GenServer.cast(@server, {:crash, reason})
  end
 

#  defdelegate make_move(game, guess), to: Game
#  defdelegate new_game(),             to: Game
#  defdelegate new_game(word),         to: Game
#  defdelegate tally(game),            to: Game

end
