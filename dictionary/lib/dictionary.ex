defmodule Dictionary do

  defdelegate start_link(), to: Dictionary.DictionaryImpl

  defdelegate random_word(), to: Dictionary.DictionaryImpl

end
