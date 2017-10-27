defmodule Hangman.Server do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, 
                         {}, 
                         name: __MODULE__)
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

  def handle_call(:tally, _from, game) do
    {:reply, Hangman.Game.tally(game), game}
  end

  def handle_call(:get_game, _from, game) do
    {:reply, game, game}
  end

  def handle_cast({:new_game, word}, _game) do
    {:noreply, Hangman.Game.new_game(word)}
  end

  def handle_cast({:make_move, guess}, game) do
    {new_game, _tally} = Hangman.Game.make_move(game, guess)
    { :noreply, new_game}
  end
end