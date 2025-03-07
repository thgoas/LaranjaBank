defmodule LaranjaBank.Repo do
  use Ecto.Repo,
    otp_app: :laranja_bank,
    adapter: Ecto.Adapters.Postgres
end
