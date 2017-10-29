#Describe
I create a surpervisor tree 
The parent Surpervisor has two children. The first one is used to matian the game state of each Hangman game, the second one is a subsurpervisor. The strategy for parent surpervisor is rest_for_one.
##Surpervisor
The children of subsurpervisor are hangman games, the strategy is simple one for one.
