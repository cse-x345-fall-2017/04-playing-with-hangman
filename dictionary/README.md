
Please write a couple of sentences explaining your choice of restart
strategy.

For the supervision restart strategy of my dictionary application I 
have selected `:transient`. I chose this over others such as
`:permanent` and `:temporary`, because the dictionary is required to
create new hangman games, so if it stops unexpectedly/abnormally then 
it will need to be restarted so that new games can be created. However, 
if the process is ended normally such as if the user chooses to quit 
the game then the dictionary should stay shutdown.
