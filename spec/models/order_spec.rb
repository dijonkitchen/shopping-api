require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'creates successfully' do
    customer = Customer.create(first_name: 'Jon', last_name: 'Chen')
    order = customer.orders.create
    expect(order).to be_truthy
  end
end
