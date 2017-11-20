defmodule Dictionary do
  use Application
  # def start_link() do
  #   Agent.start_link(fn -> Dictionary.WordList.word_list(), name: WordList)
  # end
  
  # def random_word() do
  #   Agent.get(WordList, fn word_list -> Enum.random(word_list))
  # end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
     children = [
         worker(Dictionary.WordList, [])
       ]
     opts = [strategy: :one_for_one, name: Dictionary.Supervisor]
     Supervisor.start_link(children, opts)
  end

  defdelegate random_word, to: Dictionary.WordList 
end
