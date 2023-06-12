defmodule HealthTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HealthTrackerWeb.Telemetry,
      # Start the Ecto repository
      HealthTracker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HealthTracker.PubSub},
      # Start Finch
      {Finch, name: HealthTracker.Finch},
      # Start the Endpoint (http/https)
      HealthTrackerWeb.Endpoint
      # Start a worker by calling: HealthTracker.Worker.start_link(arg)
      # {HealthTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HealthTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HealthTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
