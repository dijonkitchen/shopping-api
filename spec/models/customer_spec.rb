require 'rails_helper'

RSpec.describe Customer, type: :model do
  customer = Customer.create(first_name: 'Jonathan', last_name: 'Chen')

  it 'create successfully' do
    expect(customer).to be_truthy
  end

  it 'has a first name' do
    expect(customer.first_name).to eq('Jonathan')
  end

  it 'has a last name' do
    expect(customer.last_name).to eq('Chen')
  end

  it 'has many orders' do
    2.times { customer.orders.create }
    expect(customer.orders.length).to be >= 2
  end
end
