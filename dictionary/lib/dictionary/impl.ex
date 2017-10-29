defmodule Dictionary.Impl do
    alias Dictionary.WordList

    @name :dictionary_impl

    def start_link() do
        Agent.start_link( fn -> WordList.word_list end, name: @name)
    end

    def random_word() do
        Agent.get(@name, fn word -> WordList.random_word(word) end)
    end
end