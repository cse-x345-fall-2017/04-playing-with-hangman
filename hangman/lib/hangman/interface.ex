defmodule Hangman.Interface do

  def start_link() do
    pid = spawn_link(__MODULE__, :send_receive, [])
    :global.register_name(:server, pid)
  end

  def send_receive() do

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

    send_receive()

  end

end
