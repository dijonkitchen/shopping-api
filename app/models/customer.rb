class Customer < ApplicationRecord
  has_many :orders

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
