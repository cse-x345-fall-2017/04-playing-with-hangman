defmodule Dictionary.WordList do

  def random_word(lists) do
    lists
    |> Enum.random()
  end                              # End of random_word
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end                              # End of word_list
end                                # End of WordList
