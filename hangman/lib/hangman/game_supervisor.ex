defmodule Hangman.GameSupervisor do
  use Supervisor

  def start_link(state_server) do
    {:ok, _pid} = Supervisor.start_link(__MODULE__, state_server)
  end

  def init(state_server) do
    children = [ 
      worker(Hangman.Server, [state_server])
    ]
    supervise children, strategy: :one_for_one
  end
end