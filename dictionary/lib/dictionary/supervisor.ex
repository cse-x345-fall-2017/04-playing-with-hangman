defmodule Dictionary.Supervisor do
  @name :dictionarySuper
  def start_link(name) do
  import Supervisor.Spec, warn: false

	children = [
    worker(Dictionary.Agent, [])
	]

	operations = [
	    strategy: :one_for_one,
	    restart: :transient,
	    name: name
        ]

	    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  def start_link() do
    	start_link(@name)
  end

end
