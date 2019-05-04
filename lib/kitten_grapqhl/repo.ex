defmodule KittenGrapqhl.Repo do
  use Ecto.Repo,
    otp_app: :kitten_grapqhl,
    adapter: Ecto.Adapters.Postgres
end
