
Choice of restart strategy for Dictionary - 

Dictionary module has Supervisor has "Dictionary.Supervisor" as an children and it has configured supervision strategies as "one-for-one" i.e if a child "Dictionary" process terminates, only that process is restarted.
	
the supervisor restarts a child process depending on its :restart configuration.

I have decided to set :restart configuration to :transient, i.e supervisor does not restart the child "Dictionary" in case it exits with reason :normal, :shutdown or {:shutdown, term}.

