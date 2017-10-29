defmodule Hangman.Impl do

  def new_game(game_id) do
    Hangman.Game.new_game()
    |> make_game(game_id)
  end

  def new_game(game_id, word) do
    Hangman.Game.new_game(word)
    |> make_game(game_id)
  end

  def make_move(game_id, guess) do
    make_call(game_id, { :make_move, guess })
  end

  def tally(game_id) do
    make_call(game_id, { :tally })
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

  defp make_game(game, game_id) do
    case GenServer.whereis(ref(game_id)) do
      nil ->
        { :ok, _pid } = Supervisor.start_child( Hangman.Supervisor,
                                                [game_id, game] )
        game
      _exists ->
        { :error, :game_exists }
    end
  end

end
