
defmodule Dictionary.Store do
  
  use GenServer,restart: :transient

    def start_link() do
      Agent.start_link(fn -> word_list() end, name: Dictionary.Store)
    end

    def word_list do
      "../../assets/words.txt"
      |> Path.expand(__DIR__)
      |> File.read!()
      |> String.split(~r/\n/)
    end

end
