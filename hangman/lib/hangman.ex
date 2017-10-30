defmodule Hangman do
  alias Hangman.HangmanServerImpl, as: Game
  
  defdelegate make_move(game, guess), to: Game
  defdelegate new_game(),             to: Game
  defdelegate new_game(word),         to: Game
  defdelegate tally(game),            to: Game

end
