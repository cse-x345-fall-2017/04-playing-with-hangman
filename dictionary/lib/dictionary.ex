defmodule Dictionary do
  use Application

  defdelegate random_word(), to: Dictionary.Agent

  def start(_type, _args) do
    Dictonary.Supervisor.new_dictionary()
  end

end
