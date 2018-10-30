
defmodule TokenServiceWeb.TokenController do
  use TokenServiceWeb, :controller


  def index(conn, %{"updated_time" => updated_time, "limit" => limit,
                    "offset" => offset, "symbols" => symbols}) do

    symbs = (if symbols, do: %{"symbol" => symbols}, else: %{})
    query = (if updated_time, do: symbs |> Map.merge(%{updated_time: updated_time}), else: symbs)
    off = (if offset, do: offset, else: 1)
    lt = (if limit, do: limit, else: nil)

    cursor = Mongo.find(:mongo, "tokens", query, offset: off, limit: lt,
                         pool: DBConnection.Poolboy)

    tokens = cursor |> Enum.to_list
    conn |> put_status(:ok)
         |> render(TokenServiceWeb.TokenView, "tokens.json", tokens: tokens)
  end


  def symbol(conn, %{"symbol" => symbol}) do
    token = Mongo.find_one(:mongo, "tokens", %{symbol: symbol}, limit: 1, pool: DBConnection.Poolboy)
    conn |> put_status(:ok)
         |> render(TokenServiceWeb.TokenView, "token.json", token: token || %{})
  end
end
