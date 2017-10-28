defmodule Hangman do
  alias Hangman.Connector, as: Connector
  alias Hangman.Supervisor, as: Supervisor
  
  defdelegate make_move(game, guess), to: Connector

  defdelegate tally(game),            to: Connector

  defdelegate new_game(),             to: Supervisor

  defdelegate new_game(word),         to: Supervisor
  
end
