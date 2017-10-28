defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(
      [%{
        id: Hangman.Server,
        start: {Hangman.Server, :start_link, []},
        restart: :transient
      }],
      strategy: :one_for_one, name: Hangman
      )
  end
end
