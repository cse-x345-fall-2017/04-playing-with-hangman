defmodule Dictionary.Agent do

  @default_name :PragDave

  alias Dictionary.WordList

  def start_link() do
    Agent.start_link(&WordList.word_list/0, name: @default_name)
  end

  def random_word(name) do
    Agent.get(name, &Dictionary.WordList.random_word/1)
  end

  def random_word() do
    random_word(@default_name)
  end

end
