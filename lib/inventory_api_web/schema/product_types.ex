defmodule InventoryApiWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation

  alias InventoryApiWeb.Resolvers

  @desc "Product"
  object :product do
    field :id, :id
    field :reference, :string
    field :sku, :string
    field :price, :float
  end

  object :get_products do
    @desc "list of products"

    field :products, list_of(:product) do
      resolve(&Resolvers.Products.list_products/2)
    end
  end

  object :get_product do
    @desc """
    Get specific product
    """

    field :product, :product do
      arg(:id, non_null(:id))

      resolve(&Resolvers.Products.get_product/2)
    end
  end

  object :create_product do
    @desc "Create a product"

    @desc """
    Create a product
    """
    field :create_product, :product do
      arg :reference, non_null(:string)
      arg :sku, non_null(:string)
      arg :price, non_null(:float)

      resolve(&Resolvers.Products.create_product/2)
    end
  end

  object :update_product do
    @desc """
    Update a product
    """

    @desc "Update a product"
    field :update_product, :product do
      arg(:id, non_null(:id))
      arg(:name, :string)

      resolve(&Resolvers.Products.update_product/2)
    end
  end

  object :delete_product do
    @desc """
    Delete a specific product
    """

    field :delete_product, :product do
      arg(:id, non_null(:id))

      resolve(&Resolvers.Products.delete_product/2)
    end
  end

end
