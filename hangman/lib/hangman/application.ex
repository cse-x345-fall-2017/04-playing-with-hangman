defmodule Hangman.Application do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec, warn: false
        children = [ 
            worker(Hangman, [], restart: :transient)
        ]

        options = [strategy: :one_for_one, name: Hangman.Supervisor]
        Supervisor.start_link(children, options)
    end
end