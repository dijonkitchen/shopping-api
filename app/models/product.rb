class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :category_products
  has_many :categories, through: :category_products

  def sold(starting: Date.today - 1.year, ending: Date.today)
    orders.where(created_at: starting.beginning_of_day..(ending+1.day).end_of_day)
          .count
  end
end
