defmodule Hangman.Server do
  use GenServer

  def init do
    { :ok, Agent.get(Hangman.Store, fn state -> state end) }
  end

  def handle_call({:new_game, word }, _from, _) do
    Hangman.Game.new_game(word)
    |> update_store
    |> reply_with_game
  end

  def handle_call({:new_game}, _from, _) do
    Hangman.Game.new_game
    |> update_store
    |> reply_with_game
  end

  def handle_call({:make_move, game, guess}, _from, _) do
    Hangman.Game.make_move(game, guess)
    |> update_store
    |> reply_with_game_tally
  end

  def handle_call({:tally, game}, _from, _) do
    Hangman.Game.tally(game)
    |> reply_with_tally(game)
  end

  def terminate(_reason, state) do
    update_store(state)
  end

  #######################

  def update_store({ game, tally }) do
    Agent.update(Hangman.Store, fn _ -> game end)
    { game, tally }
  end

  def update_store(game) do
    Agent.update(Hangman.Store, fn _ -> game end)
    game
  end

  def reply_with_game(game) do
    {:reply, game, game}
  end

  def reply_with_tally(tally, game) do
    {:reply, tally, game}
  end

  def reply_with_game_tally({ game, tally }) do
    {:reply, { game, tally }, game }
  end

end
