defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      %{
        id: Hangman,
        start: { Hangman, :start_link, [] },
        restart: :transient
      },
      %{
        id: Hangman.Store,
        start: { Hangman.Store, :start_link, [] },
        restart: :transient
      }
    ]

    options = [
      strategy: :one_for_one,
      name: Hangman.Server
    ]

    { :ok, _pid } = Supervisor.start_link(children, options)
  end
end
