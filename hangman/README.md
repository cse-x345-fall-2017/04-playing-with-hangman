8k students only:

Describe how to run the multinode app.

I have modified the hangman module to spawn a process registered as :foo. This process waits for :new_game requests and responds by creating a new game server and passing its pid. This pid is then used by the human_player module to interact with the game server.

Steps to run my code:
1. Run Hangman on a named node.
2. Copy the node name
3. Start HumanPlayer in iex and run HumanPlayer.play_with(:node_name) to start a new game
