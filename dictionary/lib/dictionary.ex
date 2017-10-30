defmodule Dictionary do

  defdelegate start_link(),  to: Dictionary.WordList
  defdelegate random_word(), to: Dictionary.WordList

end
