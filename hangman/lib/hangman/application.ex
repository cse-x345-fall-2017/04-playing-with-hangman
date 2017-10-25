defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([
      %{id: Hangman.Store,
        start: {Hangman.Store, :start_link, []},
        restart: :transient},
      %{id: Hangman,
        start: {Hangman, :start_link, []},
        restart: :transient}
    ], strategy: :one_for_one, name: Hangman.Supervisor)
  end
end
