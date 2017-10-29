defmodule Hangman.Server do
  use GenServer

  def start_link(state_server) do
    GenServer.start_link(__MODULE__, 
                         state_server, 
                         name: __MODULE__)
  end

  def init(state_server) do
    current_game = Hangman.StateServer.get_game(state_server)
    {:ok, {state_server, current_game}}
  end

  def new_game() do
    new_game(Dictionary.random_word)
  end

  def new_game(word) do
    GenServer.cast(__MODULE__, {:new_game, word})
    GenServer.call(__MODULE__, :get_game)
  end

  def tally(_game) do
    GenServer.call(__MODULE__, :tally)
  end

  def make_move(game, guess) do
    GenServer.cast(__MODULE__, {:make_move, guess})
    {game, tally(game)}
  end

  def handle_call(:tally, _from, {state_server, game}) do
    {:reply, Hangman.Game.tally(game), {state_server, game}}
  end

  def handle_call(:get_game, _from, {state_server, game}) do
    {:reply, game, {state_server, game}}
  end

  def handle_cast({:new_game, word}, {state_server, _game}) do
    {:noreply, {state_server, Hangman.Game.new_game(word)}}
  end

  def handle_cast({:make_move, guess}, {state_server, game}) do
    {new_game, _tally} = Hangman.Game.make_move(game, guess)
    Hangman.StateServer.save_game(state_server, new_game)
    { :noreply, {state_server, new_game}}
  end

  def terminate(_reason, {state_server, game}) do
    Hangman.StateServer.save_game(state_server, game)
  end
end