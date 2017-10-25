defmodule Dictionary.Store do

  use GenServer

  def start_link() do
    Agent.start_link( &Dictionary.WordList.word_list/0, name: __MODULE__ )
  end

  def random_word() do
    Agent.get(__MODULE__, &Dictionary.WordList.random_word/1)
  end

end
