class ProductTableAdd < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :list_price, :integer
    change_column :products, :sell_price, :integer
    add_column :products, :user_id, :integer
    add_column :products, :sku, :string
  end
end