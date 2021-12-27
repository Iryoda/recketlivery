defmodule Recketlivery.Orders.TotalPrice do
  alias Recketlivery.Item

  def calculate(items) do
    items
    |> Enum.reduce(Decimal.new("0.00"), &sum_prices(&1, &2))
  end

  defp sum_prices(%Item{price: price}, acc), do: Decimal.add(price, acc)
end
