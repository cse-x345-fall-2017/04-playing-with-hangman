defmodule Hangman do
  alias Hangman.Client, as: Client

  defdelegate new_game(),       to: Client
  defdelegate new_game(word),   to: Client
  defdelegate tally(game),      to: Client
  defdelegate make_move(game, guess),       to: Client

  def start_link do
    GenServer.start_link(Hangman.Server, [], name: __MODULE__)
  end

end
