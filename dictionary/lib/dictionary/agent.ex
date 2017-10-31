defmodule Dictionary.Agent do
  @name __MODULE__
  def start_link() do
    alias Dictionary.WordList
    Agent.start_link(&WordList.word_list/0, name: @name )
  end

  def random_word() do
    Agent.get(@name,&(&1 |> Enum.random()
                         |> String.trim_trailing("\r")))
  end

  def suicide() do
    Agent.get(@name,&(&1+100))
  end
end
