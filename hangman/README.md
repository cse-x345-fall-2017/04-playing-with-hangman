8k students only:

Describe how to run the multinode app.

Choice of restart strategy for Hangman -

Root supervisor has two children: the Dictionary, and Hangman supervisor.
The root supervisor uses supervision strategy as "one_for_one" as restart strategy, if the child processes are terminated and then all child processes (including the terminated one) are restarted.
The second-layer supervisor (which supervises the dictionary servers), in turn, uses a one-for-one strategy, so that whenever a it crashes, that dictionary only re-started.

I have decided to set :restart configuration to :permanent, i.e the child process is always restarted.

permanent restart strategy is used, because the Hangman game server must be up and running all times, as it has dependency on the game server workers
