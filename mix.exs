defmodule Crawler.Mixfile do
  use Mix.Project

  def project do
    [app: :crawler,
     version: "0.1.0",
     elixir: "~> 1.4",
     escript: [main_module: CrawlerMain],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [mod: {CrawlerApp, []},
     extra_applications: [:logger, :httpoison, :hackney, :floki]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 1.1.1"},
      {:floki, "~> 0.20.1"},
      {:cookie_jar, "~> 1.0.3"}
    ]
  end
end
