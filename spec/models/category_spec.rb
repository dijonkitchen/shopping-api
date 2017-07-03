require 'rails_helper'

RSpec.describe Category, type: :model do
  category = Category.create(name: 'Games')

  it 'creates a category with a name' do
    expect(category.name).to eq('Games')
  end

  it 'has many products' do
    category.products.create(name: 'Bang!')
    expect(category.products.last.name).to eq('Bang!')
  end
end
