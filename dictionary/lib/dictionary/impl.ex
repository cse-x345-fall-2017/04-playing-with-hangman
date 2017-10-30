defmodule Dictionary.Impl do
  
  def random_word() do
    Agent.get(Dictionary.Store, fn store -> store end) |> Enum.random()
  end

end
