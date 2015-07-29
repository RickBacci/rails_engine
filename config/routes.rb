Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do

      # For your merchants, invoices, items, invoice_items, and customers

      # GET api/v1/merchants/random.json
      # GET /api/v1/merchants/1.json
      # GET /api/v1/merchants/find?id=12
      # GET /api/v1/merchants/find?name=Schroeder-Jerde
      # GET /api/v1/merchants/find_all?name=Cummings-Thiel

      objects = [:merchants, :invoices, :items, :invoice_items, :customers]

      #objects.each do
      get '/merchants/random',   to: 'merchants#random'
      get '/merchants/:id',      to: 'merchants#show'
      get '/merchants/find_all', to: 'merchants#find_all'
      get '/merchants/find',     to: 'merchants#find'


    end
  end
end
