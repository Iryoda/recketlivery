import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :recketlivery, Recketlivery.Repo,
  username: "postgres",
  password: "postgres",
  database: "recketlivery_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :recketlivery, RecketliveryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8o/YGKq2/ZlyrjD36RfDqFjd/h4dgtYXfbOY7ULLKT2uZL1I/6cjnB0bKL353q8V",
  server: false

config :recketlivery, Recketlivery.Users.Create, via_cep_adapter: Recketlivery.ViaCep.ClientMock

# In test we don't send emails.
config :recketlivery, Recketlivery.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
