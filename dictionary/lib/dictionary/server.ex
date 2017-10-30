defmodule Dictionary.Server do

  def handle_call({ :get }, _from, state) do
    { :reply,
    Dictionary.Impl.random_word,
    state }
    
  end

  def init(_args) do
    Dictionary.Impl.start_link
    { :ok, 0 }
  end
  
  
end