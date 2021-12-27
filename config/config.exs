# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :recketlivery,
  ecto_repos: [Recketlivery.Repo]

config :recketlivery, Recketlivery.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :recketlivery, Recketlivery.Users.Create, via_cep_adapter: Recketlivery.ViaCep.Client

config :recketlivery, RecketliveryWeb.Auth.Guardian,
  issuer: "recketlivery",
  secret_key: "IyVGnTtXhijcbQ/6dOYv43EXY3jloGRWVhfaqN9TEyDOT2jLQierqVHp+Clgy/AH"

config :recketlivery, RecketliveryWeb.Auth.Pipeline,
  module: RecketliveryWeb.Auth.Guardian,
  error_handler: RecketliveryWeb.Auth.ErrorHandler

# Configures the endpoint
config :recketlivery, RecketliveryWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RecketliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Recketlivery.PubSub,
  live_view: [signing_salt: "KmRwiMll"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :recketlivery, Recketlivery.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.13.5",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
