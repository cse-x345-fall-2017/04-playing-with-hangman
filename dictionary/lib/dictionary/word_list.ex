defmodule Dictionary.WordList do
  use Agent
  @me WordListPid

  def start_link(_args) do
    Agent.start_link(fn -> "" end, name: @me)
  end

  def random_word() do
    Agent.update(@me, fn _state -> get_word() end)
    Agent.get(@me, fn state -> state end)
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
  
  defp get_word do
    word_list()
    |> Enum.random
  end
end