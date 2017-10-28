8k students only:

Describe how to run the multinode app.
1. Open one terminal window as a server, give the node a long name and set its cookie.
   iex --name x@x --cookie secret_token -S mix
2. Open one terminal window as a client, give the node a long name and set its cookie.
   iex --name x@x --cookie secret_token -S mix
3. You can open as many clients as you want.
4. At the client, run 'HumanPlayer.play(arg)' where 'arg' is the long name of the server node.
5. Here we go! Enjoy the game and take a look at the server terminal.
   It will inform you of what is going on! 