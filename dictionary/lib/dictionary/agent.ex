defmodule Dictionary.Agent do
  alias Dictionary.WordList, as: WordList
  
  def start_link() do
    Agent.start_link(WordList, :word_list, [], name: __MODULE__)
  end

  def random_word() do
    Agent.get(__MODULE__, WordList, :random_word, [])
  end

end
