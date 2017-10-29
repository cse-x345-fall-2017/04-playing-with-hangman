defmodule Dictionary.Agent do

  def start_link() do
    Agent.start_link(Dictionary.WordList, :word_list, [], name: __MODULE__)
  end

  def random_word() do 
    Agent.get(__MODULE__, Dictionary.WordList, :random_word, [])
  end;

end