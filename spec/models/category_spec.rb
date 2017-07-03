require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'exists' do
    expect(Category.new).to be_truthy
  end
end
