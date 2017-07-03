require 'rails_helper'

RSpec.describe Order, type: :model do
  customer = Customer.create(first_name: 'Jon', last_name: 'Chen')
  order = customer.orders.create

  it 'creates successfully' do
    expect(order).to be_truthy
  end

  it "defaults status detail to 'Waiting for delivery'" do
    new_order = customer.orders.create
    expect(new_order.status).to eq(0)
    expect(new_order.status_detail).to eq('Waiting for delivery')
  end

  it "can change status detail to 'On its way'" do
    order.status = 1
    expect(order.status).to eq(1)
    expect(order.status_detail).to eq('On its way')
  end

  it "can change status detail to 'Delivered'" do
    order.status_detail = 'Delivered'
    expect(order.status).to eq(2)
    expect(order.status_detail).to eq('Delivered')
  end

  it 'has many products' do
    order.products.create(name: 'Settlers of Catan')
    expect(order.products.last.name).to eq('Settlers of Catan')
  end
end
