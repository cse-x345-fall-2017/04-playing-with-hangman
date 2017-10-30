defmodule Hangman do
  alias Hangman.Game, as: Game
  alias Hangman.Impl, as: Impl
  
  defdelegate make_move(game, guess), to: Game
  defdelegate new_game(),             to: Game
  defdelegate new_game(word),         to: Game
  defdelegate tally(game),            to: Game
  defdelegate get(state),             to: Impl
  defdelegate set(new_state),         to: Impl

end
