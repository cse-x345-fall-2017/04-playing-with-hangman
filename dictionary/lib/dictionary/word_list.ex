defmodule Dictionary.WordList do

  @name :word_agent

  def start_link() do
    Agent.start_link(fn -> word_list() end, name: @name)
  end

  def random_word() do
    Agent.get(@name, fn state -> state end)
    |> Enum.random()
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
