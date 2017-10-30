defmodule Dictionary.Application do

  use Application
    import Supervisor.Spec, warn: false

  def start(_type, _args) do
    children = [
      {Dictionary.WordList, []}
    ]

    opts = [strategy: :one_for_one, name: Dictionary.Supervisor, restart: :transient]
    Supervisor.start_link(children, opts)
  end
end
