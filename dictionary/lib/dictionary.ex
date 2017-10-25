defmodule Dictionary do

  defdelegate random_word(), to: Dictionary.Store

  use Application

  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    children = [
      worker(Dictionary.Store, [])
    ]
    opts = [ strategy: :one_for_one,
             name:     Dictionary.Supervisor,
             restart:  :transient ]
    Supervisor.start_link(children, opts)

  end


end
