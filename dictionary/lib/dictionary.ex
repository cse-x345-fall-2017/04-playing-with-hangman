defmodule Dictionary do

  use Application
  defdelegate random_word(), to: Dictionary.Agent

  # TODO(lukewood) I should make start take a name arg
  #                and pass it down the chain.
  def start(_type, _args) do
    Dictionary.Supervisor.start_link()
  end

end
