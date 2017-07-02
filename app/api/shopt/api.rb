module Shopt
  class API < Grape::API
    version 'v1', using: :header, vendor: 'shopt'
    format :json

    resource :customers do
      desc 'Returns all customers.'
      get do
        Customer.all
      end

      desc 'Return a customer.'
      params do
        requires :id, type: Integer, desc: 'Customer id.'
      end
      route_param :id do
        get do
          Customer.find(params[:id])
        end
      end

    end
  end
end
