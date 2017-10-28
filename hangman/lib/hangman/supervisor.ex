defmodule Hangman.Supervisor do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end
  
  def init(_arg) do
    Supervisor.init([Hangman.Connector], strategy: :simple_one_for_one)
  end
  
  def new_game do
    { :ok, pid } = Supervisor.start_child(__MODULE__, [])
    pid
  end

  def new_game(word) do
    { :ok, pid } = Supervisor.start_child(__MODULE__, [word])
    pid
  end

  def terminate_child(pid) do
    Supervisor.terminate_child(__MODULE__, pid)
  end
  
end
    
