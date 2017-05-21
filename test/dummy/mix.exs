defmodule Dummy.Mixfile do
  use Mix.Project

  def project do
    [app: :dummy,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      extra_applications: extra_applications(Mix.env)
    ]
  end

  def extra_applications(:test) do
    extra_applications() ++ [
      :exlager_unit,
    ]
  end

  def extra_applications(_) do
    extra_applications() ++ [
    ]
  end

  def extra_applications() do
    [
      :lager,
    ]
  end

  defp deps do
    [
      {:exlager, github: "khia/exlager"},
      {:exlager_unit, path: "../..", only: :test},
    ]
  end
end
