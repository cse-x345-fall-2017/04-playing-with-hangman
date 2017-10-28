defmodule Dictionary do

  @name WordStore

  def start_link() do
    Agent.start_link(Dictionary.WordList, :word_list,[], name: @name)
  end
  def random_word() do
    Agent.get(@name, Dictionary.WordList, :random_word, [])
  end
end
