Using the :one_for_all strategy here because both dictionary and hangman are largely independent of each other.
Dictionary has no dependency on hangman, and hangman only requires that the dictionary app be running when it 
calls its new_game function. Therefore this is no requirement to use a more complex strategy.