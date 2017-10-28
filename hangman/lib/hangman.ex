defmodule Hangman do
  use Application
  alias Hangman.Game, as: Game

  defdelegate make_move(game, guess), to: Game
  defdelegate new_game(),             to: Game
  defdelegate new_game(word),         to: Game
  defdelegate tally(game),            to: Game

  def start(_type, _args) do
    
  end

end
