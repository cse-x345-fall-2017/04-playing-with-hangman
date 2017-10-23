defmodule Dictionary do
  use Agent

  defdelegate random_word(), to: Dictionary.WordList

  def start_link do
    Agent.start_link(&Dictionary.WordList.word_list/0, name: __MODULE__)
  end

end
