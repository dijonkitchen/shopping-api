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

        route_param :orders do
          get do
            Customer.find(params[:id]).orders
          end
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
      desc 'Returns quantity sold per month'
      params do
        requires :id, type: Integer, desc: 'Product ID.'
        optional :per, type: String, desc: 'Time interval',
                  default: 'month', values: ['day', 'week', 'month']
        optional :starting, type: Date, desc: 'Beginning date', default: Date.today - 1.year
        optional :ending, type: Date, desc: 'Ending date', default: Date.today
      end
      route_param :id do
        get do
          Product.find(params[:id]).sold(per: params[:per], starting: params[:starting], ending: params[:ending])
        end
      end
    end

  end
end
