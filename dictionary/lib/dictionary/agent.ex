defmodule Dictionary.Agent
do

alias Dictionary.WordList
@name :Agent_Dave

  def start_link() do
    Agent.start_link(&WordList.word_list/0, name: @name)
  end

  def random_word() do
    Agent.get(@name, &WordList.random_word/1)
  end

end
