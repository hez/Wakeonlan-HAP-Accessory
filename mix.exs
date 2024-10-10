defmodule WakeonlanHAPAccessory.MixProject do
  use Mix.Project

  def project do
    [
      app: :wakeonlan_hap_accessory,
      version: "0.1.0",
      elixir: "~> 1.17",
      aliases: aliases(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_apps: [:mix, :ex_unit],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {WakeonlanHAPAccessory.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # dev only
      {:credo, "~> 1.7.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.2", only: [:dev, :test], runtime: false},
      # everything else
      {:hap, "~> 0.4"},
      {:socket, "~> 0.3"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"],
      build: ["deps.get", "compile", "release --overwrite"]
    ]
  end
end
