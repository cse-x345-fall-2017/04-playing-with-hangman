defmodule Dictionary.Store do

  use GenServer

  alias Dictionary.WordList

  def start_link() do
    Agent.start_link( &WordList.word_list/0, name: __MODULE__ )
  end

end
