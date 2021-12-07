defmodule InventoryApiWeb.Resolvers.Products do
  alias InventoryApi.Catalog
  #alias InventoryApi.Catalog.Product

  def list_products(_args, _context) do
    {:ok, Catalog.list_products()}
  end

end
