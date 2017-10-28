defmodule Hangman.Impl do

  def new_game(game_id) do
    case GenServer.whereis(ref(game_id)) do
      nil ->
        game = Hangman.Game.new_game()
        { :ok, pid } = Supervisor.start_child(Hangman.Supervisor,[game_id, game])
        { pid, game }
      _game ->
        { :error, :game_exists}
    end
  end

#  def new_game(pid) do
#    GenServer.call(pid, :new_game)
#  end
#
#  def new_game(pid, word) do
#    GenServer.call(pid, { :new_game, word })
#  end

  def make_move(game_id, guess) do
    make_call(game_id, { :make_move, guess })
#    GenServer.call(ref(game_id), { :make_move, game, guess })
  end

  def tally(game_id) do
    make_call(game_id, { :tally })
#    GenServer.call(ref(game_id), { :tally, game })
  end

  defp make_call(game_id, tuple) do
    case GenServer.whereis(ref(game_id)) do
      nil ->
        { :error, :invalid_game_id }
      game ->
        GenServer.call(game, tuple)
    end
  end

  defp ref(game_id) do
    { :global, { :game, game_id } }
  end

end
