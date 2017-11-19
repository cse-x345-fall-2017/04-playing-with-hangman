defmodule Hangman do
  use Application
  alias Hangman.Game, as: Game
  
  @name GameSupervisor

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
     children = [
       worker(Game, [], [])
     ]
     opts = [strategy: :simple_one_for_one, name: @name]
     
     pid = spawn(Hangman, :establish_connections, [])
     Process.register(pid, :foo)

     Supervisor.start_link(children, opts)
  end

  def new_game() do
    {:ok, pid} = Supervisor.start_child(@name, [])
    game = GenServer.call(pid, :new_game)
    {pid, game}
  end

  def make_move(pid, game, guess) do
    GenServer.call(pid, {:make_move, game, guess})
  end

  def tally(pid, game) do
    GenServer.call(pid, {:tally, game})
  end

  def establish_connections() do
    IO.puts(node())
    receive do
      {pid, :new_game} -> send(pid, new_game()) 
    end
    establish_connections()
  end

  # defdelegate make_move(game, guess), to: Game
  # defdelegate new_game(),             to: Game
  # defdelegate new_game(word),         to: Game
  # defdelegate tally(game),            to: Game

end
