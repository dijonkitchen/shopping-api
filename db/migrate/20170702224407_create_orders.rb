class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.integer :customer_id, null: false

      t.timestamps
    end

    add_foreign_key :orders, :customers, on_delete: :cascade
  end
end
