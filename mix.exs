defmodule ExlagerUnit.Mixfile do
  use Mix.Project

  def project do

    [aliases: aliases(),app: :exlager_unit,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do

    [extra_applications: [],
     mod: {LagerUnit.Application, []}]
  end

  defp aliases() do
    [
      test: "exlager_unit.test"
    ]
  end

  defp deps do
    []
  end
end
