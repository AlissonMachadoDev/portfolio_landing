defmodule PortfolioLanding.Repo do
  use Ecto.Repo,
    otp_app: :portfolio_landing,
    adapter: Ecto.Adapters.Postgres
end
