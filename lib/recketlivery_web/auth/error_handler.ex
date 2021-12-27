defmodule RecketliveryWeb.Auth.ErrorHandler do
  alias Guardian.Plug.ErrorHandler

  import Plug.Conn

  @behaviour ErrorHandler

  @impl ErrorHandler
  def auth_error(conn, {error, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(error)})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, body)
  end
end
