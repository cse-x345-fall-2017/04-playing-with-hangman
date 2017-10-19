defmodule Dictionary.WordList do

  def random_word(list_of_words) do
    list_of_words
    |> Enum.random()
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
    |> Enum.map(&String.trim/1) # remove any /r characters
  end
end
