defmodule Dictionary.Supervisor do

  @default_name PragDave

  def start_link(name) do
    import Supervisor.Spec
    children = [
      worker(Dictionary.Agent, [])
    ]

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
