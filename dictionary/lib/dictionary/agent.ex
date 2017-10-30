defmodule Dictionary.Agent do
   @name : dictionaryAgent

   def start_link() do
       Agent.start_link(&Disctionary.WordList.word_list/0, name: @name)
   end

   def random_word(name) do
       Agent.get(@name, &Dictionary.WordList.random_word/1)
   end

   def random_word() do
      random_word(@name)
   end

end
