defmodule InventoryApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :reference, :string
      add :sku, :string
      add :price, :float

      timestamps()
    end
  end
end
