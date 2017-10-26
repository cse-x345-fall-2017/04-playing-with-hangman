defmodule Dictionary do

  use Application

  alias Dictionary.Supervisor

  defdelegate random_word(), to: Dictionary.Agent

  def start(_type, _args) do
    IO.puts "HELLO"
    Dictionary.Supervisor.start_link()
  end

end
