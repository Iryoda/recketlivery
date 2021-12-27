defmodule Recketlivery.Items.Update do
  alias Recketlivery.{Item, Error}
  alias Recketlivery.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Item, id) do
      nil -> {:error, Error.build_item_not_found_error()}
      item -> do_update(item, params)
    end
  end

  def do_update(item, params) do
    item
    |> Item.changeset(params)
    |> Repo.update()
  end
end
