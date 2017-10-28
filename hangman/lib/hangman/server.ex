defmodule Hangman.Server do
  use GenServer
  @store :data_store

  alias Hangman.Game, as: Game

  def start_link do
    Agent.start_link(fn -> "" end, name: @store)
  end

  def init do
      {:ok, Agent.get(@store, fn state -> state end)}
  end

  def handle_call({:new_game, word}, _from, _) do
    Game.new_game(word) |>
    update_state |>
    reply
  end

  def handle_call({:new_game}, _from, _) do
    Game.new_game |>
    update_state |>
    reply
  end

  def handle_call({:make_move, game, guess}, _from, _) do
    Game.make_move(game, guess) |>
    update_state |>
    reply(true, false)
  end

  def handle_call({:tally, game}, _from, _) do
    Game.tally(game) |>
    reply(true, false)
  end

  ### Server workings calls

  def update_state({game, tally}) do
    Agent.update(@store, &(&1))
    {game, tally}
  end

  def update_state(game) do
    Agent.update(@store, &(&1))
    game
  end

  # Can we do named arguments with default values?
  # I'd prefer this to look like
  # reply(game, send_tally: true, send_game: true)
  def reply(game, send_tally\\true, send_game\\true) do
    inner_reply(game, Game.tally(game), send_tally, send_game)
  end

  defp inner_reply(game, _tally, true, false) do
    {:reply, game, game}
  end

  defp inner_reply(game, tally, true, true) do
    {:reply, tally, game}
  end

  defp inner_reply(game, tally, true, false) do
    {:reply, {game, tally}, game}
  end
end
