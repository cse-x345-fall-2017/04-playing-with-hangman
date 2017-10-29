defmodule Dictionary.Agent do
  alias Dictionary.WordList, as WordList

  @me DICTIONARYagent

  def start_link() do
    Agent.start_link(fn -> WordList.word_list end, name: @me)
  end                                                           # End of start_link


  def random_word() do
    Agent.get(@me, fn lists-> WordList.random_word(lists) end)
  end                                                           # End of random_word


end                                                             # End of Agent
