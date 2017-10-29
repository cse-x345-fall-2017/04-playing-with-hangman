defmodule Dictionary.Supervisor do

  @name :dict_sup
  
  
  def start_link() do
    import Supervisor.Spec, warn: false
    
    children = [
      worker(Dictionary.Agent, [])
    ]
    
    opts = [
      strategy: :one_for_one,
      restart:  :permanent,   # always restart
      name:     @name
    ]
    
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
  
end
