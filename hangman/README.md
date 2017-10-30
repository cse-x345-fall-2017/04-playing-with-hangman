I chose `:transient` as the restart strategy, so that if the Hangman
process shuts down abnormally it will restart, but if we want to terminate
it then it will shut down, for example if we have a quit option from the
client, it could shut down the Hangman server, but if we want a new game,
it could spawn another one.
