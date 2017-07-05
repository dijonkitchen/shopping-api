class Customer < ApplicationRecord
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products, through: :order_products
  has_many :category_products, through: :products
  has_many :categories, through: :category_products

  def num_purchased_in(category)
    Product.joins(:categories).joins(:orders)
           .where(
             categories: {
               id: category.id
             },
             orders: {
               id: orders
             }
           )
           .count
  end
end
