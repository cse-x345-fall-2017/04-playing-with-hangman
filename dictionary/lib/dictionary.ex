defmodule Dictionary do

  use Application

  defdelegate random_word(), to:dictinoary.WordList

  def start(_type, _args) do
      Dictionary.Supervisior.start()
  end

end
