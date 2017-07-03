class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :category_products
  has_many :categories, through: :category_products
end
