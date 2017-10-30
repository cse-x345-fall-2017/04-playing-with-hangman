defmodule Hangman.Server do
  use GenServer
  @store Hangman.Store

  def init do
    { :ok, Agent.get(@store, fn state -> state end) }
  end

  def new_game() do
    GenServer.call(Hangman, { :new_game })
  end

  def new_game(word) do
    GenServer.call(Hangman, { :new_game, word })
  end

  def tally(game) do
    GenServer.call(Hangman, { :tally, game })
  end

  def make_move(game, guess) do
    GenServer.call(Hangman, { :make_move, game, guess })
  end

  def handle_call({ :new_game, word }, _, _) do
    game = Hangman.Game.new_game(word) |> Hangman.Impl.update_state
    { :reply, game, game }
  end

  def handle_call({ :new_game }, _, _) do
    game = Hangman.Game.new_game() |> Hangman.Impl.update_state
    { :reply, game, game }
  end

  def handle_call({ :make_move, game, guess }, _, _) do
    game = Hangman.Game.make_move(game, guess) |> Hangman.Impl.update_state
    { :reply, game, game }
  end

  def handle_call({ :tally, game }, _, _) do
    tally = Hangman.Game.tally(game)
    { :reply, tally, game }
  end

end
