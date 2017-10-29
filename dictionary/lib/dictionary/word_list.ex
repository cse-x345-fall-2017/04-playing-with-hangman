defmodule Dictionary.WordList do

  @name __MODULE__

  def start_link,
  do: Agent.start_link(fn -> word_list() end, name: @name)

  def update,
  do: Agent.update(@name, fn(_state) -> word_list() end)

  def get,
  do: Agent.get(@name, fn(word_list) -> Enum.random(word_list) end)

  def random_word() do
    get()
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
