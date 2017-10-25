defmodule Hangman.Server do
  use GenServer

  def init(arg) do
    { :ok, Agent.get(Hangman.Store, fn state -> state end) }
  end

  def handle_call({:new_game, word }, _from, _) do
    game = Hangman.Game.new_game(word)
    {:reply, game, game }
  end

  def handle_call({:new_game}, _from, _) do
    game = Hangman.Game.new_game
    {:reply, game, game }
  end

  def handle_call({:make_move, game, guess}, _from, _) do
    { game, tally } = Hangman.Game.make_move(game, guess)
    {:reply, { game, tally}, game }
  end

  def handle_call({:tally, game}, _from, _) do
    tally = Hangman.Game.tally(game)
    {:reply, tally, game }
  end

  def terminate(_reason, state) do
    Agent.update(Hangman.Store, fn _ -> state end)
  end

end
