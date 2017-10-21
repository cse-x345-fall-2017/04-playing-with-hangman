defmodule HumanPlayer do
  @doc """
  This is how you start an interactive game of Hangman. Call

      HumanPlayer.play

  and it will create a new game, show you the current state, and
  then interact with you as you make guesses.
  """

  defdelegate play(game_node), to: HumanPlayer.Impl
end
