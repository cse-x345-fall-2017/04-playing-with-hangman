defmodule Hangman.Supervisor do

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker( Hangman.HangmanImpl, [], restart: :permanent )
    ]

    supervise( children, strategy: :one_for_one )
  end
end