defmodule Dictionary.Agent do

  @agent_name __MODULE__    

  def start_link() do
    Agent.start_link(&Dictionary.WordList.word_list/0, name: @agent_name)
  end

  def random_word() do
    Agent.get(@agent_name, &Dictionary.WordList.random_word/1)
  end

end
