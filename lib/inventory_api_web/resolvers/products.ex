defmodule InventoryApiWeb.Resolvers.Products do
  alias InventoryApi.Catalog
  alias InventoryApi.Catalog.Product

  def list_products(_args, _context) do
    {:ok, Catalog.list_products()}
  end

  def get_product(%{id: id}, _context) do
    {:ok, Catalog.get_product!(id)}
  end

  def create_product(args, %{}) do
    case Catalog.create_product(args) do
      {:ok, %Product{} = product} -> {:ok, product}
      {:error, changeset} -> {:error, inspect(changeset.errors)}
    end
  end

  def create_product(_args, _context), do: {:error, "Not Authorized"}

  def update_product(%{id: id} = params, %{}) do
    case Catalog.get_product!(id) do
      nil ->
        {:error, "Product not found"}

      %Product{} = product ->
        case Catalog.update_product(product, params) do
          {:ok, %Product{} = product} -> {:ok, product}
          {:error, changeset} -> {:error, inspect(changeset.errors)}
        end
    end
  end

  def update_product(_args, _context), do: {:error, "Not Authorized"}

  def delete_product(%{id: id}, %{}) do
    case Catalog.get_product!(id) do
      nil -> {:error, "Product not found"}
      %Product{} = product -> Catalog.delete_product(product)
    end
  end

  def delete_product(_args, _context), do: {:error, "Not Authorized"}

end
