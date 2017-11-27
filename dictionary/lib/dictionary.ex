defmodule Dictionary do

  defdelegate random_word(), to: Dictionary.WordList

end

defmodule Dictionary.Server do

 use GenServer

 #client side function
 def start_link do
  GenServer.start_link(Dictionary, [])
 end

 def get_msgs(pid) do
 GenServer.call(pid, :add_msg)
 end

 def add_msg(pid, msg) do
 GenSever.cast(pid, {:add_msg, msg})
 end

 # Server side function
 def init(msgs) do
 {:ok, msgs}
 end

 def handle_call(:get_msg, _from,msgs) do
 {:replay, msgs, msgs}
 end

 def handle_cast({:add_msg,msg}, msgs) do
 {:noreply, [msg | msgs]}
 end

end
