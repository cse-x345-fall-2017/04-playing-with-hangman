7345 Students:

I chose :permanent as the restart strategy.
Because in order to pass all tests without rewriting the given implementation of
the module Hangman.Game, I designed only one GenServer in the application.
Game is treated as a structure, not a pid.And new_game() only gives a new state
to the GenServer. In such situation, we need the server to be running all the time
until we exit the application.
