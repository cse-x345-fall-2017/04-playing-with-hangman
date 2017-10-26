
Please write a couple of sentences explaining your choice of restart
strategy.  

I chose `:transient` as the restart strategy, so that if the Dictionary
process shuts down abnormally it will restart, but if in the future we add
multiple dictionaries with different word lists, then we could swap out
dictionaries between games. For example if our hangman client supported
multiple languages, we could spawn a dictionary with the current language,
then terminate that one if we change languages in the client.
