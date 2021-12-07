defmodule InventoryApi.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventoryApi.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        price: 120.5,
        reference: "some reference",
        sku: "some sku"
      })
      |> InventoryApi.Catalog.create_product()

    product
  end
end
