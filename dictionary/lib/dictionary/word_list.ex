defmodule Dictionary.WordList do

  def random_word(state) do
    state
    |> Enum.random()
    |> String.trim()
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
