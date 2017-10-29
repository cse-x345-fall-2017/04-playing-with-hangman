defmodule Hangman.Supervisor do 
  use Supervisor

  def start_link() do
    result = {:ok, supervisor} = Supervisor.start_link(__MODULE__, [])
    start_children(supervisor)
    result
  end

  def start_children(supervisor) do
    {:ok, state_server} = Supervisor.start_child(supervisor, worker(Hangman.StateServer,[]))

    Supervisor.start_child(supervisor, supervisor(Hangman.GameSupervisor, [state_server]))
  end

  def init(_arg) do
    supervise([], strategy: :one_for_one)
  end
end
