defmodule Dictionary.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([
      %{id: Dictionary.WordList,
        start: {Dictionary.WordList, :start_link, []},
        restart: :transient}
    ], strategy: :one_for_one, name: Dictionary.Supervisor)
  end
end
