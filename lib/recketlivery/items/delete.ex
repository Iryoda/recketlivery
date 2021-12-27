defmodule Recketlivery.Items.Delete do
  alias Recketlivery.{Error, Item}
  alias Recketlivery.Repo

  def call(id) do
    case Repo.get(Item, id) do
      nil -> {:error, Error.build_item_not_found_error()}
      item -> Repo.delete(item)
    end
  end
end
