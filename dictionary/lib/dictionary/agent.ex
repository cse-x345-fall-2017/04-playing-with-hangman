defmodule Dictionary.Agent
do

@name :Agent_Dave

  def start_link() do
    Agent.start_link(&Dictionary.WordList.word_list/0, name: @name)
  end

  def random_word() do
    Agent.get(@name, &Dictionary.WordList.random_word/1)
  end

end
