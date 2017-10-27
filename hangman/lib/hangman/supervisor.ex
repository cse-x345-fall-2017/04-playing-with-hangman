defmodule Hangman.Supervisor do 
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: Hangman.Server)
  end

  def init(_arg) do
    Supervisor.init([{Hangman, []}], strategy: :one_for_one)
  end
end
