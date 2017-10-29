defmodule Hangman.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Hangman.Worker.start_link(arg)
      worker(Hangman, [])
    ]

    opts = [strategy: :one_for_one,
    	    name: Hangman.Supervisor,
	    restart: :permanent]
    Supervisor.start_link(children, opts)
  end
end
