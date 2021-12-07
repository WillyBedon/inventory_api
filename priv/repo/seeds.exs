# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InventoryApi.Repo.insert!(%InventoryApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias InventoryApi.Catalog.Product
alias InventoryApi.Repo

%Product{reference: "SSD1TB", sku: "906557773", price: 200.25} |> Repo.insert!
%Product{reference: "MBRD500X", sku: "287998876", price: 355.00} |> Repo.insert!
%Product{reference: "DSP32LED", sku: "3454545666", price: 620.10} |> Repo.insert!
