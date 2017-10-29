defmodule Dictionary.DictionaryImpl do
  alias Dictionary.WordList, as: WordList
  @name Dictionary.Impl

  use Agent

  def start_link() do
    Agent.start_link( fn -> WordList.word_list  end, name: @name)
  end

  def random_word() do
    Agent.get(@name, fn state -> WordList.random_word(state) end)
  end

end