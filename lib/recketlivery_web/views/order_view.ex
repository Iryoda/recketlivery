defmodule RecketliveryWeb.OrdersView do
  use RecketliveryWeb, :view

  alias Recketlivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created",
      order: order
    }
  end
end
