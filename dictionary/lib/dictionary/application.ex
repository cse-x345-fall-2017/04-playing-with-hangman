defmodule Dictionary.Application do
  use Application

  def start(_type, _arg) do
    import Supervisor.Spec, warn: false

    children = [
      %{
        id: Dictionary.WordList,
        start: { Dictionary.WordList, :start_link, [] },
        restart: :transient
      }
    ]

    options = [
      strategy: :one_for_one,
      name: Dictionary.Supervisor
    ]

    { :ok, _pid } = Supervisor.start_link(children, options)
  end
end
