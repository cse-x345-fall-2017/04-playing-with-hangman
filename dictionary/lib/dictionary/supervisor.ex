defmodule Dictionary.Supervisor do
  use GenServer

  @default_name __MODULE__

  def new_dictionary(name) do
    {:ok, agent} = Agent.start_link(Dictionary.WordList.word_list/0, name: name)
    agent
  end

  def new_dictionary() do
    new_dictionary(@default_name)
  end

end
