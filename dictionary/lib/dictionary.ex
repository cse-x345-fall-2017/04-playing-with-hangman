defmodule Dictionary do

  defdelegate random_word(), to: Dictionary.WordList

  defdelegate start_link(), to: Dictionary.WordList

end
