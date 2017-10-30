# Describe
I create a surpervisor tree.
## Parent Surpervisor
The parent Surpervisor has two children. 
The first child(stash) is used to matian the game state of each Hangman game when it's terminated. 
The second child is a subsurpervisor. 
The strategy for parent surpervisor is one_for_one. By this strategy, when the stash is down, only crashed games cannot restore the recording game state.
## SubSurpervisor
The children of subsurpervisor are hangman games, the strategy for this subsurpervisor is simple one for one because it must be able to start game dynamically. 
