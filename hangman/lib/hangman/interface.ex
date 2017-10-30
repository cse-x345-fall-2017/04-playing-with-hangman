defmodule Hangman.Interface do

  def start_link() do
    pid = spawn_link(__MODULE__, :messenger, [])
    :global.register_name(:server, pid)
  end

  def messenger() do

    receive do
      { from, :new_game, game_id } ->
        send from, Hangman.Impl.new_game(game_id)

      { from, :new_game, game_id, word } ->
        send from, Hangman.Impl.new_game(game_id, word)

      { from, :make_move, game_id, guess } ->
        send from, Hangman.Impl.make_move(game_id, guess)

      { from, :tally, game_id } ->
        send from, Hangman.Impl.tally(game_id)
    end

    messenger()

  end

end
