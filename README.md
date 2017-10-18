# Hangman—The OTP iteration

It's time to take our Hangman game up a notch.

This assignment takes the Dictionary and Hangman modules and turns them into a supervised set of OTP servers.

# For Everyone

You'll be creating supervised servers for both the dictionary and
hangman. Remember to split the code into appropriate modules as we
discussed.

### Dictionary

1. Convert the dictionary to use a named Agent. This means you'll need
   to add a `start_link` call to the API, and store the word list as
   an agent. Calls to random word will access this agent by name, and
   use it to find a random word.
      
2. Supervise this agent, and make dictionary start it automatically
   when the dictionary application is loaded. 
   
   You'll need to choose supervision and restart strategies for the
   dictionary. I'd suggest `one_for_one` for the supervision, and I
   wnt you to pick the restart. *Write a sentence or two in
   `dictionary/README.md` explaining your choice.*
   
3. "Test" your dictionary by starting it in iex. You should be able to
   call `random_word` immediately. If you use `Process.kill(pid,
   :boom)`, it should exit and then restart automatically. Confirm
   that `random_word` still works, and that its PID has changed.

   
## Hangman

#### For all students

1. Convert the hangman module into an OTP server.

#### For 5345 and 7345 Students

2. Add a supervisor, and turn it into an application. Choose a restart
   strategy that will restart the game if it crashes. Explain your
   choice in one or two sentences in `hangman/README.md`.
   
3. Verify that the game starts automatically. (Note that the
   dictionary should also get loaded and started because it is listed
   as a dependency.)
   
4. Verify it passes all tests.

5. Go into `human_player` and play a game using 

       mix run -e HumanPlayer.play
       

#### For 8k Students

2. Add a supervisor that uses the `simple_one_for_one` strategy. This
   means that hangman will not be run automatically. Instead, you'll need
   to change `new_game` at the API level to create a new game server, and
   use that to play the game. The net result is that your hangman will be
   capable of running multiple simulataneous games.

3. Verify this in iex using something like this:

   ```
   iex> g1 = Hangman.new_game
   <#PID:...>
   iex> g2 = Hangman.new_game
   <#PID:...>
   ~~~
   
   Then play g1 and g2, and verify they are different games.
   
4. Now modify human_player. Remove the dependency on hangman, because
   we are no longer going to run it in the same application. Instead,
   you'll run the hangman server in a named local node on your
   machine. Change the human_player to also run in a node, connecting
   to the hangman server node. It will then call the hangman
   supervisor to create a new game, and play that game as normal.
   Verify that you can have the hangman server running in one terminal
   window, and two human players running in two more windows. Make
   sure that the human players are playing independent games.
   
5. Give me instructions in `hangman/README.md` telling me how to set this up.
   
   


# Grading

A total of 100 marks are available:

60 for a working program (one that passes the tests included here and any
   others I may run while grading)

10 for elegant code

10 for good-looking code

10 for the rest :)


5xxx and 7xxx:

10 for a good description of the restart strategy


8xxx:

10 for a good description of how to run the multinode game

