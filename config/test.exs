use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kitten_grapqhl, KittenGrapqhlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :kitten_grapqhl, KittenGrapqhl.Repo,
  username: "postgres",
  password: "postgres",
  database: "kitten_grapqhl_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
