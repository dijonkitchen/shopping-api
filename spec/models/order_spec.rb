require 'rails_helper'

RSpec.describe Order, type: :model do
  customer = Customer.create(first_name: 'Jon', last_name: 'Chen')
  order = customer.orders.create

  it 'creates successfully' do
    expect(order).to be_truthy
  end

  it 'defaults status to waiting for delivery' do
    expect(order.status).to eq(0)
  end
end
