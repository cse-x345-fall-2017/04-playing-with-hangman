defmodule Hangman.Server do
  
  use GenServer
  
  def init(arg) do
    { :ok, arg }
  end

  ############################
  # GenServer implementation #
  ############################

  def handle_call({:new_game, word}, _from, _current_game) do
    new_game = new_game(word)
    { :reply, Hangman.Impl.set(new_game), new_game }
  end

  def handle_call(:new_game, _from, _current_game) do
    new_game = new_game()
    { :reply, Hangman.Impl.set(new_game), new_game }
  end
  
  def handle_call({:make_move, game = %{ game_state: state }, guess}, _from, _current_game) when state in [:won, :lost] do
    saved_game = Hangman.Impl.get(game)
    {new_game, new_tally} = make_move(saved_game, guess)
    Hangman.Impl.set(new_game)
    { :reply, {new_game, new_tally}, {new_game, new_tally} }
  end
  
  def handle_call({:make_move, game, guess}, _from, _current_game) do
    saved_game = Hangman.Impl.get(game)
    {new_game, new_tally} = make_move(saved_game, guess)
    Hangman.Impl.set(new_game)
    { :reply, {new_game, new_tally}, {new_game, new_tally} }
  end
  
  def handle_call({:tally, game}, _from, _current_game) do
    saved_game = Hangman.Impl.get(game)
    new_tally = tally(saved_game)
    { :reply, new_tally, new_tally }
  end

  ############################################################

  defp new_game(word) do
    %Hangman.State {letters: word
    |> String.codepoints}
  end
  
  defp new_game() do
    new_game(Dictionary.random_word)
  end

  defp make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    game
    |> return_with_tally()
  end

  defp make_move(game, guess) do
    %{ game | last_guess: guess }
    |> accept_move(guess, MapSet.member?(game.used, guess))
    |> return_with_tally()
  end

  defp tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters:    game.letters |> reveal_guessed(game.used),
      used:       game.used |> Enum.to_list,
      last_guess: game.last_guess,
    }
  end

  ############################################################
  
  defp accept_move(game, _guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  defp accept_move(game, guess, _already_guessed) do
    Map.put(game, :used, MapSet.put(game.used, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, _good_guess = true) do
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.used)
    |> maybe_won()
    Map.put(game, :game_state, new_state)
  end

  defp score_guess(game = %{ turns_left: 1}, _not_good_guess) do
    Map.put(game, :game_state, :lost)
  end

  defp score_guess(game = %{ turns_left: turns_left}, _not_good_guess) do
    %{ game |
       game_state: :bad_guess,
       turns_left: turns_left - 1
    }
  end

  defp reveal_guessed(letters, used) do
    letters
    |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end)
  end

  defp reveal_letter(letter, _in_word = true), do: letter
  defp reveal_letter(_letter, _not_in_word),   do: "_"
  
  defp maybe_won(true), do: :won
  defp maybe_won(_),    do: :good_guess

  defp return_with_tally(game) do
    { game, tally(game) }
  end

end