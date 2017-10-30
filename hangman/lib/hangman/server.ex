defmodule Hangman.Server do
  alias Hangman.Game
  use Supervisor
  use GenServer
  @supname __MODULE__

 

 def start_link() do
 GenServer.start_link(__MODULE__, 0, name: @supname)
 end

 def make_move(game,guess) do
 GenServer.call(game,{:make_move,guess})
 end

 def tally(game) do 
 GenServer.call(game,:tally)
 end

 def new_game() do 
 GenServer.call(@supname,:new_game)
 end
 
 def new_game(word) do
 GenServer.call(@supname,{:new_game,word})
 end

 def handle_call(:new_game,_from,_state) do 
 {:reply,self(),Game.new_game}
 end



 def handle_call({:new_game,word},_from,_state) do 
 {:reply,self(),Game.new_game(word)}
 end



  def handle_call({ :make_move,guess }, _from, state) do
    {game,tally}= Game.make_move(state,guess)
    {:reply,{self(), tally},game}
  end

  

  def handle_call(:tally, _from, state) do
    { :reply, Game.tally(state), state }
  end


end