require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'successful request' do
      get '/api/customers'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /customers/:id' do
    it 'successful request' do
      customer = Customer.create(first_name: 'J', last_name: 'C')
      get "/api/customers/#{customer.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['first_name']).to eq('J')
    end
  end

  describe 'GET /customers/:id/orders' do
    it 'successful request' do
      customer = Customer.create(first_name: 'J', last_name: 'C')
      2.times { customer.orders.create }
      get "/api/customers/#{customer.id}/orders"
      expect(response).to have_http_status(200)
    end
  end
end
