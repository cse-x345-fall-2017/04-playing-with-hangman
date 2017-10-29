defmodule Dictionary.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(Dictionary.Agent, [])
    ]
    opts = [
      strategy: :one_for_one,
      name: Dictionary.Supervisor
    ]
    Supervisor.start_link(children, opts)
  end                                           # End of start

end                                             # End of Application

