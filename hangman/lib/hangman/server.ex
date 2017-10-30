defmodule Hangman.Server do

  alias Hangman.Game, as: Game

  use GenServer

  def start_link(game_id, game) do
    {:ok, _pid} = GenServer.start_link( __MODULE__, [game],
                                        name: ref(game_id) )
  end


  ######Implementation######
  def handle_call(:new_game, _from, state) do
    { :reply, Game.new_game(), state }
  end

  def handle_call({ :new_game, word }, _from, state) do
    { :reply, Game.new_game(word), state }
  end

  def handle_call({ :make_move, guess }, _from, state) do
    { game, tally } = Game.make_move(get_state(state), guess)
    { :reply, { game, tally }, [game] }
  end

  def handle_call({ :tally }, _from, state) do
    { :reply, Game.tally(get_state(state)), state }
  end

  defp ref(game_id) do
    { :global, { :game, game_id } }
  end

  defp get_state(state) do
    state
    |> Enum.fetch!(0)
  end
  
end
