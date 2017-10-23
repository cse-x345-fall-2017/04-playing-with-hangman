defmodule Hangman.GameListener do
  
  def start_link() do
    pid = spawn_link(__MODULE__, :cmd_handler, [])
    :global.register_name(:game_node, pid)
  end
  
  # loop to receive incoming messages
  def cmd_handler() do
    receive do
      {from, :new_game} ->
        game = Hangman.new_game()
        send from, {:ok, game}
        
      {from, :new_game, word} ->
        game = Hangman.new_game(word)
        send from, {:ok, game}
      
      {from, :make_move, game, guess} ->
        result = Hangman.make_move(game, guess)
        send from, {:ok, result}
        
      {from, :tally, game} ->
        tally = Hangman.tally(game)
        send from, {:ok, tally}
    end
    
    cmd_handler()
  end
  
end
