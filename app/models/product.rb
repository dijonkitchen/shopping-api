class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :category_products
  has_many :categories, through: :category_products

  def sold(starting: Date.today - 1.year, ending: Date.today)
    # SELECT COUNT(orders.id), DATE(orders.created_at)
    # FROM orders
    # INNER JOIN order_products
    #   ON order_products.order_id = orders.id
    # INNER JOIN products
    #   ON products.id = order_products.product_id
    # WHERE products.id = 1
    #   AND products.created_at
    #     BETWEEN DATE('2017-01-01')
    #       AND DATE('2017-07-30')
    # GROUP BY DATE(orders.created_at);
    orders.where(created_at: starting.beginning_of_day..(ending+1.day).end_of_day)
          .group('DATE(orders.created_at)')
          .count
  end
end
