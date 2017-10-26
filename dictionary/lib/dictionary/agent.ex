defmodule Dictionary.Agent do

  @default_name PragDave

  alias Dictionary.WordList

  def start_link(name) do
    Agent.start_link(WordList.word_list, name: name)
  end

  def start_link() do
    start_link(@default_name)
  end

  def random_word(name) do
    Agent.get(name, &WordList.random_word/1)
  end

  def random_word() do
    random_word(@default_name)
  end

end
