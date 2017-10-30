defmodule Hangman do
  @global_name :"Hangman_Server"
  alias Hangman.Server, as: Server
  alias Hangman.SubSupervisor
  defdelegate make_move(game, guess), to: Server
  defdelegate new_game(),             to: SubSupervisor
  defdelegate new_game(word),         to: SubSupervisor
  defdelegate tally(game),            to: Server
  defdelegate terminate(name),        to: Server
  defdelegate listener(),             to: Server
  def start(_type,_args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(Hangman.Stash,[]),
      supervisor(Hangman.SubSupervisor,[])
    ]
    opts =[ strategy: :one_for_one]
    pid = spawn(__MODULE__,:listener,[])
    :global.register_name(@global_name,pid)
    Supervisor.start_link(children,opts)
   
  end


end
