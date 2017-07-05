require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    it 'successful request' do
      get '/api/products'
      expect(response).to have_http_status(200)
    end
  end
end
