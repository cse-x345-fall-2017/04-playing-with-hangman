defmodule Hangman do
  @me HANGMANserver



  def start_link(default \\ []) do
    GenServer.start_link(Hangman.Server, default, name: @me)
  end                                                        # End start_link


  def make_move(_game, guess) do
    GenServer.call(@me, { :make_move, guess })
  end                                                        # End make_move


  def new_game() do
    GenServer.call(@me, { :new_game })
  end                                                        # End new_game without init_word


  def new_game(word) do
    GenServer.call(@me, { :new_game, word })
  end                                                        # End new_game with init_word


  def tally(_game) do
    GenServer.call(@me, { :tally })
  end                                                        # End new_game with init_word


end                                                          # End of Hangman
