defmodule Dictionary.WordList do

  use GenServer

  @default_name __MODULE__

  def random_word(name) do
    Agent.get(&Enum.random(&1)/1, name: name)
  end

  def random_word() do
    random_word(@default_name)
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
