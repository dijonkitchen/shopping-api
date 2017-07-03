class AddOrderProductsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
    end

    add_foreign_key :order_products, :orders, on_delete: :cascade
    add_foreign_key :order_products, :products, on_delete: :cascade
  end
end
