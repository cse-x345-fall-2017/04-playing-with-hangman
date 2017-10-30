defmodule Dictionary do
  
  defdelegate random_word(), to: Dictionary.Agent
  defdelegate start_link(),  to: Dictionary.Agent

end
