defmodule Hangman.Supervisor do

  use Supervisor
  
  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: Hangman.WorkerSupervisor)
  end
  
  def init(args) do
    Supervisor.init([
      {Hangman.Game, [args]}
    ],
      strategy: :one_for_one)
  end
end