defmodule Hangman.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hangman,
      version: "0.1.0",
      elixir: ">= 1.4.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [
        :logger
      ],
      mod: {Hangman.Application, []}
    ]
  end

  defp deps do
    [
      {:dictionary, path: "../dictionary" }
    ]
  end
end
