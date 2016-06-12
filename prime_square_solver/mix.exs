defmodule PrimeSquareSolver.Mixfile do
  use Mix.Project

  def project do
    [app: :prime_square_solver,
     version: "0.0.1",
     elixir: "~> 1.2",
     escript: escript_config,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:dialyxir, "~> 0.3", only: [:dev]}
    ]
  end

  defp escript_config do
    [main_module: PrimeSquareSolver]
  end
end
