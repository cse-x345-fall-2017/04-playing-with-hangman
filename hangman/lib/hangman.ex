defmodule Hangman do
  defdelegate make_move(game, guess), to: Hangman.Server
  defdelegate new_game(),             to: Hangman.Server
  defdelegate new_game(word),         to: Hangman.Server
  defdelegate tally(game),            to: Hangman.Server
end
