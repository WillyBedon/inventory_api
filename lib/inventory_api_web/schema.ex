defmodule InventoryApiWeb.Schema do
  use Absinthe.Schema

  alias InventoryApiWeb.Schema

  import_types(Schema.ProductTypes)

  query do
    import_fields(:get_products)
    import_fields(:get_product)
  end

  mutation do
    import_fields(:create_product)
  end

end
