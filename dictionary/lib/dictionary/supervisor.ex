defmodule Dictionary.Supervisor do

  @default_name PragDave

  def start_link(name) do
    import Supervisor.Spec
    children = [
      worker(Dictionary.Agent, [])
    ]


    # Strategy: one_for_one
    #           -> if dictionary fails nothing else should fail
    # Restart: permanent
    #           -> we always want a dictionary running
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: name
    ]

    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  def start_link() do
    start_link(@default_name)
  end

end
