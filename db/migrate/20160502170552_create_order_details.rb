class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :item
      t.integer :qty
      t.integer :price
      t.string :comment
      t.references :notification, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
