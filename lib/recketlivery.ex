defmodule Recketlivery do
  alias Recketlivery.Items.Create, as: ItemCreate
  alias Recketlivery.Items.Update, as: ItemUpdate
  alias Recketlivery.Items.Delete, as: ItemDelete
  alias Recketlivery.Items.Get, as: ItemGet

  alias Recketlivery.Users.Create, as: UserCreate
  alias Recketlivery.Users.Get, as: UserGet
  alias Recketlivery.Users.Delete, as: UserDelete
  alias Recketlivery.Users.Update, as: UserUpdate

  alias Recketlivery.Orders.Create, as: OrderCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(params), to: UserGet, as: :by_id
  defdelegate delete_user_by_id(params), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate get_item_by_id(params), to: ItemGet, as: :by_id
  defdelegate update_item(params), to: ItemUpdate, as: :call
  defdelegate delete_item_by_id(params), to: ItemDelete, as: :call

  defdelegate create_order(params), to: OrderCreate, as: :call
end
