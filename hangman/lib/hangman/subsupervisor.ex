defmodule Hangman.SubSupervisor do
  @sup_name __MODULE__
  use Supervisor
  alias Hangman.Stash
  alias Hangman.Game
  def start_link() do
    children=[
      worker(Hangman.Server,[])
    ]
    Supervisor.start_link(children,
      [strategy: :simple_one_for_one, name: @sup_name])
  end

  def init(state) do
    {:ok,state}
  end
  
  def new_game(word) do
    game = word |> Game.new_game
    name =Stash.get_name
    Supervisor.start_child(@sup_name,[game,name])
    name
  end

  def new_game() do
    game = Game.new_game
    name = Stash.get_name
    Supervisor.start_child(@sup_name,[game,name])
    name
  end
end
