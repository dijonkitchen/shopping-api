class Customer < ApplicationRecord
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products, through: :order_products
  has_many :category_products, through: :products
  has_many :categories, through: :category_products

  def num_purchased_in(category)
    # Raw SQL you can test in the `rails dbconsole`
    # SELECT customers.id AS customer_id,
    #         customers.first_name AS customer_first_name,
    #         categories.id AS category_id,
    #         categories.name AS category_name,
    #         COUNT(products.id) AS number_purchased
    # FROM customers
    # INNER JOIN orders
    #   ON orders.customer_id = customers.id
    # INNER JOIN order_products
    #   ON order_products.order_id = orders.id
    # INNER JOIN products
    #   ON order_products.product_id = products.id
    # INNER JOIN category_products
    #   ON category_products.product_id = products.id
    # INNER JOIN categories
    #   ON categories.id = category_products.category_id
    # WHERE categories.id = $1
    #   AND customers.id = $2
    # GROUP BY categories.id, customers.id;
    Customer.select(:id, :first_name, 'categories.id', 'categories.name')
            .joins(:orders)
            .joins(:products)
            .joins(:categories)
            .where(categories: { id: category.id }, customers: { id: id })
            .group('categories.id', 'customers.id')
            .distinct
            .count(:products)
            .values
            .first

    # Alternative:
    # Product.joins(:categories).joins(:orders)
    #        .where(
    #          categories: {
    #            id: category.id
    #          },
    #          orders: {
    #            id: orders
    #          }
    #        )
    #        .count
  end
end
