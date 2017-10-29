8k students only:

Describe how to run the multinode app.


## Game Setup

#### Hangman Game Server:

1. In a terminal, navigate to the /hangman directory. Execute the following 
   command:
  
       iex --sname game --cookie play -S mix
       

#### Human Player #1:

1. In a new terminal, navigate to the /human_player directory. Execute the 
   following command:
   
       elixir --sname one --cookie play -S mix run -e HumanPlayer.play(<game_node_name>)
       
   where <game_node_name> is the full name of the game server node.
       

#### Human Player #2:

1. In a new terminal, navigate to the /human_player directory. Execute the same
   command as player #1, but with an --sname of two.