defmodule Dictionary.Application do

  use Application

  def start(_type, _args) do
    Dictionary.Supervisor.start_link(_args)
  end
end