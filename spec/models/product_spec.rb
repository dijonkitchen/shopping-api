require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'creates successfully' do
    product = Product.create(name: 'Widget')
    expect(product).to be_truthy
  end
end
