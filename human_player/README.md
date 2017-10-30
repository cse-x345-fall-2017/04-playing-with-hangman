# HumanPlayer

I am not a 8K student, but I try the 8K version.
## Procedure to run this program
   1) First run the Hangman with node name. For example: iex --sname node1 -S mix
   2) Second run the HumanPlayer with the node name and the same cookie. For example: iex --sname node2 -S mix
   3) Then call HumanPlayer.connect with server node's node name. For example: HumanPlayer.connect(:"node1@tang")
   4) Finally call HumanPlayer.play
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `human_player` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:human_player, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/human_player](https://hexdocs.pm/human_player).

