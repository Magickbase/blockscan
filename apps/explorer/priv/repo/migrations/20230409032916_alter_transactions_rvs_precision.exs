defmodule Explorer.Repo.Migrations.AlterTransactionsRvsPrecision do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      modify(:r, :text )
      modify(:s, :text)
    end
  end
end
