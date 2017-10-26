defmodule Dictionary do

  use Application

  defdelegate random_word(), to: Dictionary.WordList

  def start(_type, _args) do
    Dictionary.Supervisor.new_dictionary()
  end

end
