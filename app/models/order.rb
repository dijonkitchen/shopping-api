class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  def status_detail
    case status
    when 0
      'Waiting for delivery'
    when 1
      'On its way'
    when 2
      'Delivered'
    end
  end

  def status_detail=(new_status)
    case new_status
    when 'Waiting for delivery'
      self.status = 0
    when 'On its way'
      self.status = 1
    when 'Delivered'
      self.status = 2
    end
  end
end
