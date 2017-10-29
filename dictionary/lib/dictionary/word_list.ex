defmodule Dictionary.WordList do

  def random_word(word) do
    Enum.random(word)
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
