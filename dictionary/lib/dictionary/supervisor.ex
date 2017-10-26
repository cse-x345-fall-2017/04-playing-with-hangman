defmodule Dictionary.Supervisor do

@name :Supervisor_Dave

  def start_link do
    import Supervisor.Spec, warn: false

    agents = [ worker(Dictionary.Agent, []) ]

    settings = [
      strategy: :one_for_one,
      restart: :permanent,
      name: @name
    ]

    {:ok, pid} = Supervisor.start_link(agents, settings)
  end

end
