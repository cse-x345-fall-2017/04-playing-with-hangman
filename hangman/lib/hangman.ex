defmodule Hangman do
  alias Hangman.Server, as: Server

  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: Server
  defdelegate new_game(word),         to: Server
  defdelegate tally(game),            to: Server

  def start_link() do
    GenServer.start_link(Server, [], name: Hangman)
  end

end
