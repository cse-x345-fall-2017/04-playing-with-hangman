defmodule Dictionary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    
    import Supervisor.Spec, warn: false

    children = [
      # Starts a worker by calling: SuperKv.Worker.start_link(arg)
      worker(Dictionary, [] )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: Dictionary.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
