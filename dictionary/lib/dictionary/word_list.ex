defmodule Dictionary.WordList do

  use GenServer

  @server DictionaryServer

  def random_word() do
    GenServer.call(@server, { :get })
  end

  def start_link(default \\ []) do
    GenServer.start_link(Dictionary.Server, default, name: @server)
  end
end
