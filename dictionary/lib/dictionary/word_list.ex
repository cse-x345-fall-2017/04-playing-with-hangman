defmodule Dictionary.WordList do
  use GenServer

  def start_link(args) do
    Agent.start_link(&word_list/0, name: __MODULE__)
  end

  def random_word() do
    Agent.get(Dictionary.WordList, fn word_list -> Enum.random(word_list) end)
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
