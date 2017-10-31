defmodule HumanPlayer.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :human_player,
      version:         "0.1.0",
      elixir:          ">= 1.5.0",
      start_permanent: Mix.env == :prod,
      deps:            deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
     # { :hangman, path: "../hangman" }
    ]
  end
end
