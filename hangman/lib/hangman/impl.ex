defmodule Hangman.Impl do
  use GenServer
  @store Hangman.Store

  def update_state({game, tally}) do
    Agent.update(@store, fn _ -> game end)
    { game, tally }
  end

  def update_state(game) do
    Agent.update(@store, fn _ -> game end)
    game
  end
end
