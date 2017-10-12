defmodule BootstrapEx.Mixfile do
  use Mix.Project
	@version "0.0.1"
		
  def project do
    [
      app: :bootstrap_ex,
      version: @version,
			elixir: "~> 1.3",
      start_permanent: Mix.env == :prod,
			deps: deps(),
			name: "BootstrapEx",
			description: "Build Bootstrap 4 components for Elixir and Phoenix",
			docs: [source_ref: "v#{@version}", main: "BootstrapEx.html", source_url: "https://github.com/mortadaak/bootstrap_ex"],
			package: package(),
		]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
			{:phoenix_html, "~> 2.10"},
			{:ex_doc, "~> 0.12", only: :dev},
			{:mix_test_watch, "~> 0.3", only: :dev, runtime: false}      
		]
	end
	defp package do
    [
			maintainers: ["Mortada AlKhars"],
     	licenses: ["MIT"],
			 files: ["lib", "mix.exs", "README*", "LICENSE*"],
		 	links: %{github: "https://github.com/mortadaak/bootstrap_ex"}
		]
  end
end
