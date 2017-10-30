defmodule Hangman.Server do
  use GenServer

  alias Hangman.Game, as: Game

  def handle_call({:new_game, word}, _from, _) do
    Game.new_game(word) |>
    reply_game
  end

  def handle_call({:new_game}, _from, _) do
    Game.new_game |>
    reply_game
  end

  def handle_call({:make_move, game, guess}, _from, _) do
    Game.make_move(game, guess) |>
    reply
  end

  def handle_call({:tally, game}, _from, _) do
    Game.tally(game) |>
    reply_tally(game)
  end

  ### Reply calls to update state

  def reply_tally(tally, game) do
    {:reply, tally, game}
  end

  def reply_game(game) do
    {:reply, game, game}
  end

  def reply({game, tally}) do
    {:reply, {game, tally}, game}
  end
end
