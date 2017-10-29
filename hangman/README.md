8k students only:

Describe how to run the multinode app.

On one terminal, change current directory to 04-playing-with-hangman/hangman
Enter the following command, 
iex --sname game@localhost --cookie secret -S mix

On another terminal, change current directory to 04-playing-with-hangman/human_player
Enter the following command
elixir --sname p1@localhost --cookie secret -S mix run -e HumanPlayer.connect

Multiple players can play the game in different terminals by changing the name of the node.
