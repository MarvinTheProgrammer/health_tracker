defmodule HealthTracker.Repo do
  use Ecto.Repo,
    otp_app: :health_tracker,
    adapter: Ecto.Adapters.Postgres
end
