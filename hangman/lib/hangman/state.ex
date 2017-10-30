defmodule Hangman.State do
  
  defstruct(
    game_state: :initializing,
    last_guess: "",
    letters:    [],
    turns_left: 7,
    used:       MapSet.new([])
  )

end
