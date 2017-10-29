defmodule Dictionary do

  defdelegate random_word(), to: Dictionary.Agent

  defdelegate suicide(),     to: Dictionary.Agent
  def start(_type,_args) do
    import Supervisor.Spec, warn: false 
    children = [
    worker(Dictionary.Agent,[])
    ]
    
    opts=[ strategy: :one_for_one]
    Supervisor.start_link(children,opts)
   
  end

end
