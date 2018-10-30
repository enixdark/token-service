defmodule TokenServiceWeb.Router do
  use TokenServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", TokenServiceWeb do
    pipe_through :api
    get "/tokens", TokenController, :index
    get "/token/:symbol", TokenController, :symbol
  end
end
