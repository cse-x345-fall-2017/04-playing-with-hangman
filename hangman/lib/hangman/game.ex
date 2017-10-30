defmodule Hangman.Game do
  
  use GenServer
  @me HangmanGame

  ################
  # External API #
  ################

  def start_link(_arg) do
    GenServer.start_link(Hangman.Server, %Hangman.State{}, name: @me)
  end
  
  def new_game(word) do
    GenServer.call(@me, {:new_game, word})
  end
  
  def new_game() do
    GenServer.call(@me, :new_game)
  end

  def make_move(game = %{game_state: state }, guess) when state in [:won, :lost] do
    GenServer.call(@me, {:make_move, game, guess})
  end
  
  def make_move(game, guess) do
    GenServer.call(@me, {:make_move, game, guess})
  end
  
  def tally(game) do
    GenServer.call(@me, {:tally, game})
  end

end
