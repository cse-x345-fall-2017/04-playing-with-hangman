defmodule Hangman do

  alias Hangman.Impl, as: Server
  
  defdelegate make_move(game_id, guess), to: Server
  defdelegate new_game(game_id),         to: Server
  defdelegate new_game(game_id, word),   to: Server
  defdelegate tally(game_id),            to: Server

end
