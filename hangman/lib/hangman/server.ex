defmodule Hangman.Server do
  use GenServer
  alias Hangman.Game
  alias Hangman.Stash
  def start_link(game,name) do
    GenServer.start_link(__MODULE__,{name,game},name:
      name)
  end

  def init({name,game}) do
    game = Stash.get_game_state(name)||game
    Stash.drop_game_state(name)
    {:ok,{name,game}}
  end

  
  def terminate(_reason,{name,game}) do
    Stash.add_game_state(name,game)
  end
  
  def terminate(name) do
    GenServer.cast(name,:suicide)
  end
  
  def make_move(name,guess)do
    GenServer.call(name,{:make_move,guess})
  end

  def tally(name) do
    GenServer.call(name,:tally)
  end


  def handle_cast(:suicide,{name,game}) do
    {:stop," suicide ",{name,game}}
  end
  
  def handle_call(:tally, _from, {name,game}) do
    tally=  game |> Game.tally
    {:reply,tally,{name,game}}
  end
   
  def handle_call({:make_move, guess}, _from,{name,game}) do
    {game, tally} = game |> Game.make_move(guess)
    {:reply,{name,tally},{name,game} }
  end
  
end
