defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    children = [
      Hangman.Controller,
      Hangman.Supervisor
    ]
    opts = [strategy: :one_for_one, name: HighestSupervisor]
    Supervisor.start_link(children, opts)
  end
end
