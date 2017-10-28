defmodule HumanPlayer.Impl do

  @server_name Hangman.Controller
  @name :client
  
  def play(node) do
    Process.register(self(), @name)
    node
    |> Node.connect
    |> play_start(node)
  end

  def play_start(:true, node) do
    send { @server_name, node }, { self(), @name, node(), :new_game }
    state = receive do
      { :new_game, state } -> state
      end
    get_next_move(state, node)
  end

  def play_start(:false, _node) do
    IO.puts "Connection failed"
  end

  defp get_next_move({%{ letters: letters, game_state: :won }, _tally}, _node) do
    IO.puts "\nCONGRATULATIONS! The word was #{letters |> Enum.join}"
  end

  defp get_next_move({%{ letters: letters, game_state: :lost }, _tally}, _node) do
    clear_screen()
    IO.puts drawing(0)
    IO.puts "\nSorry, you lose. The word was: #{letters |> Enum.join}"
  end

  defp get_next_move({_game, state}, node) do
    draw_current_board(state)
    report_move_status(state)
    guess = get_guess(state)
    send { @server_name, node }, { self(), :make_move, guess }
    state = receive do
      { :next_move, state } -> state
      end
    get_next_move(state, node)
  end

  defp report_move_status(%{ game_state: :initializing }) do
  end
  
  defp report_move_status(%{ game_state: :good_guess, last_guess: guess}) do
    IO.puts "#{inspect guess} is indeed in the word!\n"
  end
  
  defp report_move_status(%{ game_state: :bad_guess, last_guess: guess}) do
    IO.puts "Ouch! #{inspect guess} is not in the word!\n"
  end

  defp report_move_status(%{ game_state: :already_guessed, last_guess: guess}) do
    IO.puts "You've already guessed #{inspect guess}.\n"
  end

  def get_guess(state = %{ used: used }) do
    if length(used) > 0 do
      IO.puts "Letters used so far: #{ used |> Enum.join(", ")}"
    end
    guess_until_valid(state)
  end

  def guess_until_valid(state) do
    guess = IO.gets("Next letter:   ") |> String.downcase |> String.trim

    cond do
      String.length(guess) != 1 ->
        IO.puts "please enter a single character"
        guess_until_valid(state)

      guess in state.used ->
        IO.puts "you already tried '#{guess}'"
        guess_until_valid(state)

      true ->
        guess
    end
  end

  def draw_current_board(state) do
    clear_screen()
    IO.puts drawing(state.turns_left)
    IO.puts "Word to guess: #{state.letters |> Enum.join(" ")}\n"
  end

  defp clear_screen(), do: IO.write "\e[H\e[2J"


  defp drawing(10) do
  """
  HANGMAN: Moves left 10






  ____________
  """
  end

  defp drawing(9) do
  """
  HANGMAN: Moves left 9




   ___
  |   |______
  |__________|
  """
  end

  defp drawing(8) do
  """
  HANGMAN: Moves left 8

    |
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(7) do
  """
  HANGMAN: Moves left 7
     ____
    |
    |
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(6) do
  """
  HANGMAN: Moves left 6
     ____
    |    |
    |
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(5) do
  """
  HANGMAN: Moves left 5
     ____
    |    |
    |    ⃝
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(4) do
  """
  HANGMAN: Moves left 4
     ____
    |    |
    |    ⃝
    |    |
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(3) do
  """
  HANGMAN: Moves left 3
     ____
    |    |
    |    ⃝
    |   /|
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(2) do
  """
  HANGMAN: Moves left 2
     ____
    |    |
    |    ⃝
    |   /|\\
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  defp drawing(1) do
  """
  HANGMAN: Moves left 1
     ____
    |    |
    |    ⃝
    |   /|\\
    |    |
   _|_  /
  |   |______
  |__________|
  """
  end

  defp drawing(0) do
  """
  HANGMAN   :(
     ____
    |    |
    |    ⊗
    |   /|\\
    |    |
   _|_  / \\
  | * |______
  |__________|
  """
  end

end
