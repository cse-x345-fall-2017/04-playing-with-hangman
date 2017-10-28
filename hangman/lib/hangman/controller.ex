defmodule Hangman.Controller do
  alias Hangman.Connector,  as: Connector
  alias Hangman.Supervisor, as: Supervisor
  
  def child_spec(_arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [[%{ clients: %{}, games: %{} }]]},
      restart: :permanent
    }
  end

  def start_link(default \\[]) do
    pid = spawn_link(__MODULE__, :message_loop, default)
    Process.register(pid, __MODULE__)
    IO.puts "Server running"
    { :ok, pid }
  end

  def message_loop(state) do
    state = receive do
      { from, name, node, :new_game } ->
	Process.monitor(from)
	pid = Supervisor.new_game()
	state = state |> add_new_client(from, name, node) |> add_new_game(from, pid)
	tally = Connector.tally(pid)
	send { name, node }, { :new_game, {tally, tally} }
	announce(state, from, "started a new game", pid)

      { from, :make_move, guess } ->
	pid = state.games[from]
	make_move(state, from, pid, guess)

      { :DOWN, _ref, :process, pid, :normal } ->
	IO.puts "the game at the client: #{inspect pid} ended"
	Supervisor.terminate_child(state.games[pid])
	update(state, pid)

      { :DOWN, _ref, :process, pid, reason } ->
	IO.puts "#{inspect pid} unwillingly exited: #{inspect reason}"
	Supervisor.terminate_child(state.games[pid])
	update(state, pid)
	
    end

    message_loop(state)
  end

  def add_new_client(state, from, name, node) do
    put_in state, [:clients, from], { name, node }
  end

  def add_new_game(state, from, pid) do
    put_in state, [:games, from], pid
  end

  def make_move(state, _from, nil, _guess) do
    state
  end

  def make_move(state, from, pid, guess) do
    game = Connector.make_move(pid, guess)
    send state.clients[from], { :next_move, game }
    announce(state, from, "maked a move", pid)
  end

  def announce(state, from, msg, game) do
    IO.puts "Client #{inspect from}: #{msg} at Server #{inspect game}"
    state
  end

  def update(state, from) do
    state = update_in(state[:clients], &(Map.drop(&1, [from])))
    update_in(state[:games], &(Map.drop(&1, [from])))
  end
  
end
