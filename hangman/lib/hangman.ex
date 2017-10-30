defmodule Hangman do

  alias Hangman.Client, as: Client

  defdelegate make_move(game, guess), to: Client
  defdelegate new_game(),             to: Client
  defdelegate new_game(word),         to: Client
  defdelegate tally(game),            to: Client

end
