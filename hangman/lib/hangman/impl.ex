defmodule Hangman.Impl do

  def get(state) do
    Agent.get(Hangman.State, fn state -> state end)
  end
  
  def set(new_state) do
    Agent.update(Hangman.State, fn _state -> new_state end)
  end

end