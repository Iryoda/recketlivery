defmodule RecketliveryWeb.WelcomeController do
  use RecketliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{msg: "nice"})
  end
end
