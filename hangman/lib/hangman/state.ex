defmodule Hangman.State do

  use GenServer

  @me Hangman.State
  
  defstruct(
    game_state: :initializing,
    last_guess: "",
    letters:    [],
    turns_left: 7,
    used:       MapSet.new([])
  )
  
  def start_link(_args) do
    Agent.start_link(fn -> %Hangman.State{} end, name: @me)
  end

end