require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'shows sales breakdown by month for a date range' do
    it 'successful request' do
      get '/api/products/1?per=month&starting=2016-12-31&ending=2017-06-30'
      expect(response).to have_http_status(200)
    end
  end
end
