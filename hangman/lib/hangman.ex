defmodule Hangman do
  
  #defdelegate make_move(game, guess), to: Hangman.Client_API
  #defdelegate new_game(),             to: Hangman.Client_API
  #defdelegate new_game(word),         to: Hangman.Client_API
  #defdelegate tally(game),            to: Hangman.Client_API

  def start_link() do
    GenServer.start_link(Hangman.Server, [], name: HangmanGenServer)
  end

  def new_game() do
    GenServer.call(HangmanGenServer, :new_game)
  end

  def new_game(word) do
    GenServer.call(HangmanGenServer, {:new_game, word})
  end

  def make_move(game, guess) do
    GenServer.call(HangmanGenServer, {:make_move, game, guess})
  end

  def tally(game) do
    GenServer.call(HangmanGenServer, {:tally, game})
  end

end
