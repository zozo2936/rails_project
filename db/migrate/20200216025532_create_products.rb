class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :list_price
      t.decimal :sell_price
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
