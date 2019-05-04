defmodule KittenGraphql.Repo do
  use Ecto.Repo,
    otp_app: :kitten_graphql,
    adapter: Ecto.Adapters.Postgres
end
