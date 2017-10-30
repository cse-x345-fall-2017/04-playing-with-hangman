defmodule Dictionary.Application do
  use Application

  def start( _type, args ) do
    Dictionary.Supervisor.start_link( args )
  end
end