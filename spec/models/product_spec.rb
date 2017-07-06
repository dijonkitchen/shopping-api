require 'rails_helper'

RSpec.describe Product, type: :model do
  product = Product.create(name: 'Widget')

  it 'creates successfully' do
    expect(product).to be_truthy
  end

  it 'has many orders' do
    expect(product.orders).to be_truthy
  end

  it 'has many categories' do
    product.categories.create(name: 'Travel Gear')
    expect(product.categories.last.name).to eq('Travel Gear')
  end

  it 'shows quantity sold' do
    expect(product.sold).to eq(0)
    Customer.last.orders.create.products << product
    expect(product.sold).to eq(1)
  end
end
