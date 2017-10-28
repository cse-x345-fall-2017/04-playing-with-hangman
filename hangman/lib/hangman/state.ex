defmodule Hangman.State do
  
  defstruct(
    game_state: :initializing,
    last_guess: "",
    letters:    [],
    turns_left: 7,
    used:       MapSet.new([])
  )

  # def start_link(args) do
  #   Agent.start_link(fn -> args |> Enum.into(%{}) end, name: KV.Store)
  # end
end

