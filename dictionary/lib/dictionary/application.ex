defmodule Dictionary.Application do
  use Application
  
  def start(_type, args \\ []) do
    import Supervisor.Spec, warn: false
    
    children = [
      worker(Dictionary, args, restart: :transient)
    ]
    
    opts = [
      strategy: :one_for_one,
      name: Dictionary.Supervisor
    ]
    
    Supervisor.start_link(children,opts)
    
  end
end
