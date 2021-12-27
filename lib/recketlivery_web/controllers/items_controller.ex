defmodule RecketliveryWeb.ItemsController do
  use RecketliveryWeb, :controller

  alias Recketlivery.Item
  alias RecketliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Recketlivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Item{} = item} <- Recketlivery.get_item_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Item{}} <- Recketlivery.delete_item_by_id(id) do
      conn
      |> put_status(:ok)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %Item{} = item} <- Recketlivery.update_item(params) do
      conn
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end
end
