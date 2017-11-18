defmodule Dictionary.WordList do
  def start_link() do
    IO.puts("starting agent")
    result = Agent.start_link(fn -> word_list() end, name: __MODULE__)
    IO.puts("Agent started")
    result
  end

  def random_word() do
    Agent.get(__MODULE__, fn word -> word end)
    |> Enum.random()
  end
  
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def demo do
    "Function call works"
  end
end
