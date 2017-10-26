defmodule Dictionary.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: Dictionary.WordList)
  end

  def init(_arg) do
    Supervisor.init([{Dictionary, []}], strategy: :one_for_one)
  end
end