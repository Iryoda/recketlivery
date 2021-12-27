defmodule RecketliveryWeb.FallbackController do
  use RecketliveryWeb, :controller

  alias RecketliveryWeb.ErrorView
  alias Recketlivery.Error

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
