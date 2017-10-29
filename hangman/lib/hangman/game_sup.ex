defmodule Hangman.GameSup do
  use Supervisor
  
  alias Hangman.GameServer
  @name :game_sup
  
  
  # === Supervisor Init ====================================================== #
  
  def start_link() do
    child_spec = 
     Supervisor.child_spec(
       GameServer, 
      start: {GameServer, :start_link, []})
     
    {:ok, _pid} = 
     Supervisor.start_link(
       [child_spec], 
      strategy: :simple_one_for_one, 
      name: @name)
  end
  
  def init(_) do
    supervise([], strategy: :simple_one_for_one)
  end
  
  
  # === Game API ============================================================= #
  
  def new_game() do
    {:ok, pid} = Supervisor.start_child(@name, [])
    GameServer.new_game(pid)
  end
  
  def new_game(word) do
    {:ok, pid} = Supervisor.start_child(@name, [])
    GameServer.new_game(pid, word)
  end

end
