defmodule Hangman.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: Hangman.Supervisor)
  end


  def init(_arg) do
    children = [
      worker(Hangman.Server, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end



end
