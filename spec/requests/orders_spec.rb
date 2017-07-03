require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /orders' do
    it 'successful request' do
      get '/api/orders'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders/:id' do
    it 'successful request' do
      customer = Customer.create(first_name: 'J', last_name: 'C')
      order = customer.orders.create
      get "/api/orders/#{order.id}"
      expect(response).to have_http_status(200)
    end
  end
end
