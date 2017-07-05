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

    resource :orders do
      desc 'Returns all orders'
      get do
        Order.all
      end

      desc 'Return an order'
      params do
        requires :id, type: Integer, desc: 'Order ID.'
      end
      route_param :id do
        get do
          Order.find(params[:id])
        end
      end
    end

    resource :products do
      desc 'Returns all products'
      get do
        Product.all
      end
    end

  end
end
