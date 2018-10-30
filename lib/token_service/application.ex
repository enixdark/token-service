require IEx
defmodule TokenService.Application do
  use Application


  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      # supervisor(TokenService.Repo, []),
      # Start the endpoint when the application starts
      supervisor(TokenServiceWeb.Endpoint, []),
      # Start your own worker by calling: TokenService.Worker.start_link(arg1, arg2, arg3)
      # worker(TokenService.Worker, [arg1, arg2, arg3]),
      worker(Mongo, [[database: Application.get_env(:token_service, :db)[:name],
                      hostname: Application.get_env(:token_service, :db)[:host],
                      port: Application.get_env(:token_service, :db)[:port],
                      username: Application.get_env(:token_service, :db)[:username],
                      password: Application.get_env(:token_service, :db)[:password],
                      name: :mongo,
                      pool: DBConnection.Poolboy]
      ])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TokenService.Supervisor]
    result = Supervisor.start_link(children, opts)

    # TokenService.Startup.ensure_indexes
    result
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TokenServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
