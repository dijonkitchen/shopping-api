require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'creates a category with a name' do
    category = Category.create(name: 'Games')
    expect(category.name).to eq('Games')
  end
end
