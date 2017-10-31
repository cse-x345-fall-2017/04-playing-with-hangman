defmodule Hangman.Stash do
  @name __MODULE__

  defp update_and_get_name({name,game}) do
    atom_name = String.to_atom("#{name}")
    {atom_name,{name+1,game}}
  end
  
  def start_link() do
    Agent.start_link(fn ->{0,%{}} end, name: @name)  
  end

  def get_name() do
    Agent.get_and_update(@name,&update_and_get_name/1)
  end

  def add_game_state(game_name,game_state) do
    Agent.update(@name, fn{name,game} ->
      game= Map.put_new(game,game_name,game_state)
      {name,game}
    end)
  end

  def get_game_state(game_name) do
    Agent.get(@name, fn{_name,game} ->
      Map.get(game,game_name)
    end)
  end
  
  def drop_game_state(game_name) do
    Agent.update(@name, fn{name,game} ->
      game= Map.drop(game,[game_name])
      {name,game}
    end)
  end
  
end
