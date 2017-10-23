defmodule Dictionary.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([
      Dictionary.WordList
    ], strategy: :one_for_one, name: Dictionary.Supervisor)
  end
end
