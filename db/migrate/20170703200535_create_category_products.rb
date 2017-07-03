class CreateCategoryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :category_products do |t|
      t.integer :category_id, null: false
      t.integer :product_id, null: false
    end

    add_foreign_key :category_products, :categories, on_delete: :cascade
    add_foreign_key :category_products, :products, on_delete: :cascade
  end
end
