defmodule Dictionary.Impl do

    use Agent

    @me WordListAgent

    def random_word() do
        Agent.get( @me, &(&1))
        |> Enum.random()
    end

    def start_link() do
        Agent.start_link( fn -> word_list() end, name: @me)
    end

    def word_list do
        "../../assets/words.txt"
        |> Path.expand(__DIR__)
        |> File.read!()
        |> String.split(~r/\n/)
    end
end