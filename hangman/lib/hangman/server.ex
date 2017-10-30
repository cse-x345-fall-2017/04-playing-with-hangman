defmodule Hangman.Server
  use GenServer


  def handle_call({:new_game, word}, _from, _) do
    Hangman.Game.new_game(word) |>
    game_response
  end

  def handle_call({:new_game}, _from, _) do
    Hangman.Game.new_game(word) |>
    game_response
  end

  def handle_call({:make_move, game, guess}, _from, _) do
    Hangman.Game.new_game(word) |>
    response
  end

  def handle_call({:tally, game}, _from, _) do
    Hangman.Game.tally(game) |>
    tally_response(game)
  end

  #calls to change state

  def game_response(game) do
    {:response, game, game}
  end

  def response({game, tally}) do
    {:response, {game, tally}, game}
  end

  def tally_response({tally, game}) do
    {:response, tally, game}
end
