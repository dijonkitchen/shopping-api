require 'rails_helper'

RSpec.describe Product, type: :model do
  product = Product.create(name: 'Widget')

  it 'creates successfully' do
    expect(product).to be_truthy
  end

  it 'has many orders' do
    expect(product.orders).to be_truthy
  end
end
