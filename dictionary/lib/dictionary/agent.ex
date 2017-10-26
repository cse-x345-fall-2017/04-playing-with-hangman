defmodule Dictonary.Agent do

  @default_name __MODULE__

  def random_word(name) do
    Agent.get(Enum.random/1, name: name)
  end

  def random_word() do
    random_word(@default_name)
  end

end
