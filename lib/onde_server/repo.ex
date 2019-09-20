defmodule OndeServer.Repo do
  use Ecto.Repo,
    otp_app: :onde_server,
    adapter: Ecto.Adapters.Postgres
end
