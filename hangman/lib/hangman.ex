defmodule Hangman do
  alias Hangman.Impl, as: Impl
  
  defdelegate make_move(game, guess), to: Impl
  defdelegate new_game(),             to: Impl
  defdelegate new_game(word),         to: Impl
  defdelegate tally(game),            to: Impl

end
