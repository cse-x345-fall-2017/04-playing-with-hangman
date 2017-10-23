defmodule Dictionary.WordList do

  def random_word() do
    Agent.get(Dictionary, fn word_list -> Enum.random(word_list) end)
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
