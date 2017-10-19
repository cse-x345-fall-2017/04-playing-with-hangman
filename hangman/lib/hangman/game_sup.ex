defmodule Hangman.GameSup do
  use Supervisor
  
  @name :game_sup
  
  def start_link() do
    {:ok, _pid} = Supervisor.start_link(__MODULE__, [], name: @name)
  end
  
  def init(_) do
    children = [
      worker(Hangman.GameServer, [])
    ]
    supervise(children, strategy: :one_for_one)
  end

end