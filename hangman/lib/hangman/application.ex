defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(
      [
        %{
          id: Hangman,
          start: {Hangman, :start_link, []},
          restart: :transient
        },
        %{
          id: Hangman.DataStore,
          start: {Hangman.DataStore, :start_link, []},
          restart: :transient
        }
      ],
      strategy: :one_for_one, name: Hangman.Server
      )
  end
end
