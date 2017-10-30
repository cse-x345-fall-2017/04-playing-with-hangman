defmodule Hangman.Application do

  use Application

  def start( _type, _args ) do
    Hangman.Supervisor.start_link()
  end
end