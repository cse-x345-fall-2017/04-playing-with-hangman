defmodule Dictionary do

  defdelegate random_word(), to: Dictionary.Agent

end
