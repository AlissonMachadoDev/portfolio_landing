defmodule PortfolioLanding.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PortfolioLandingWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:portfolio_landing, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PortfolioLanding.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PortfolioLanding.Finch},
      # Start a worker by calling: PortfolioLanding.Worker.start_link(arg)
      # {PortfolioLanding.Worker, arg},
      # Start to serve requests, typically the last entry
      PortfolioLandingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PortfolioLanding.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PortfolioLandingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
