defmodule Hangman.Client do
  def new_game() do
    GenServer.call(Hangman.Server, {:make_move})
  end
end
