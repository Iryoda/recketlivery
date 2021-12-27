defmodule RecketliveryWeb.OrdersController do
  use RecketliveryWeb, :controller

  alias Recketlivery.Order
  alias RecketliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Recketlivery.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
