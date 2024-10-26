import Config

# Configure your database
config :time_manager, TimeManager.Repo,
  url: System.get_env("DATABASE_URL"),
  ssl: true,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl_opts: [verify: :verify_none]

# Configuration de l'endpoint
config :time_manager, TimeManagerWeb.Endpoint,
  url: [
    scheme: "https",
    host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "back-8h8p.onrender.com",
    port: 443
  ],
  http: [port: System.get_env("PORT") || 4000],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: false,  # Ou configurez selon vos besoins CORS
  server: true,
  secret_key_base: System.get_env("SECRET_KEY_BASE") || raise "SECRET_KEY_BASE not set"

# Configuration de Guardian
config :time_manager, TimeManager.Guardian,
  issuer: "time_manager",
  secret_key: System.get_env("GUARDIAN_SECRET_KEY") || raise "GUARDIAN_SECRET_KEY not set"

# Enable dev routes for dashboard and mailbox
config :time_manager, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime