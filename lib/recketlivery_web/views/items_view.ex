defmodule RecketliveryWeb.ItemsView do
  use RecketliveryWeb, :view
  alias Recketlivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created",
      item: item
    }
  end

  def render("item.json", %{item: %Item{} = item}), do: %{item: item}
end
