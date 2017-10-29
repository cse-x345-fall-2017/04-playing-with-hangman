defmodule Dictionary.Impl do

  def random_word() do
    Agent.get( Dictionary.Store,
              &Dictionary.WordList.random_word/1)
  end

end
