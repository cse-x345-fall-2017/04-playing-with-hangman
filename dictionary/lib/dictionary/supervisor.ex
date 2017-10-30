defmodule Dictionary.Supervisor do

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(Dictionary.Store, [], restart: :transient)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
