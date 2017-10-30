defmodule Hangman.Game do
  
  use GenServer

  #####
  # External API

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, %Hangman.State{}, name: __MODULE__)
  end
  
  def new_game(word) do
    GenServer.call(__MODULE__, {:new_game, word})
  end
  
  def new_game() do
    GenServer.call(__MODULE__, :new_game)
  end

  def make_move(game = %{game_state: state }, guess) when state in [:won, :lost] do
    GenServer.call(__MODULE__, {:make_move, game, guess})
  end
  
  def make_move(game, guess) do
    GenServer.call(__MODULE__, {:make_move, game, guess})
  end
  
  def tally(game) do
    GenServer.call(__MODULE__, {:tally, game})
  end
  

  #####
  # GenServer implementation

  def handle_call({:new_game, word}, _from, _current_state) do
    new_state = new_game1(word)
    { :reply, new_state, new_state }
  end

  def handle_call(:new_game, _from, _current_state) do
    new_state = new_game1()
    { :reply, new_state, new_state }
  end
  
  def handle_call({:make_move, game = %{ game_state: state }, guess}, _from, _current_state) when state in [:won, :lost] do
    new_state = make_move1(game, guess)
    { :reply, new_state, new_state }
  end
  
  def handle_call({:make_move, game, guess}, _from, _current_state) do
    new_state = make_move1(game, guess)
    { :reply, new_state, new_state }
  end
  
  def handle_call({:tally, game}, _from, _current_state) do
    new_state = tally1(game)
    { :reply, new_state, new_state }
  end
  
  
  #############
  
  defp new_game1(word) do
    new_game_var = %Hangman.State {letters: word
    |> String.codepoints}
    new_game_var
  end
  
  defp new_game1() do
    new_game1(Dictionary.random_word)
  end

  defp make_move1(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    game
    |> return_with_tally()
  end

  defp make_move1(game, guess) do
    %{ game | last_guess: guess }
    |> accept_move(guess, MapSet.member?(game.used, guess))
    |> return_with_tally()
  end

  defp tally1(game) do
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
    { game, tally1(game) }
  end
end
