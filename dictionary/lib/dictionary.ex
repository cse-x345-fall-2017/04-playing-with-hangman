defmodule Dictionary do

  defdelegate start_link(),  to: Dictionary.Agent
  defdelegate random_word(), to: Dictionary.Agent

end
