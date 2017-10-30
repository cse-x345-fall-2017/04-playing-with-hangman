defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    children = [
      %{
        id: Hangman,
        start: {Hangman, :start_link, []},
        restart: :transient
      }
    ]
    opts = [
      strategy: :one_for_one,
      name: Hangman.Server
    ]
    Supervisor.start_link(children,opts)
  end
end
