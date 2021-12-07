defmodule InventoryApi.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :price, :float
    field :reference, :string
    field :sku, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:reference, :sku, :price])
    |> validate_required([:reference, :sku, :price])
  end
end
