defmodule Hangman do

  alias Hangman.Impl, as: Server
  
  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: Server
  defdelegate new_game(word),         to: Server
  defdelegate tally(game),            to: Server

end
