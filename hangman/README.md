
Please write a couple of sentences explaining your choice of restart
strategy.

For the supervision restart strategy of my hangman application I 
have selected `:transient`. I chose this over others such as
`:permanent` and `:temporary`, because the hangman is required to 
use the human_player application, so if a hangman process stops 
unexpectedly/abnormally then it will need to be restarted so that 
the human_player interface can continue to be used. However, 
if a hangman process is ended normally such as if the user chooses
to quit the game then it should stay shutdown.

8k students only:

Describe how to run the multinode app.

N/A: Not 8k student
