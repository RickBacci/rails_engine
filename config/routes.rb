Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do


      objects = ['merchants', 'invoices', 'items', 'invoice_items', 'customers']

      objects.each do |object|
        get "/#{object}/find_all", to: "#{object}#find_all"
        get "/#{object}/random",   to: "#{object}#random"
        get "/#{object}/:id",      to: "#{object}#show", constraints: { id: /\d+/ }
        get "/#{object}/find",     to: "#{object}#find"
        get "/#{object}",          to: "#{object}#index"
      end


      get '/merchants/:id/items',        to: 'merchants#items'
      get '/merchants/:id/invoices',     to: 'merchants#invoices'

      get '/invoices/:id/transactions',  to: 'invoices#transactions'
      get '/invoices/:id/invoice_items', to: 'invoices#invoice_items'
      get '/invoices/:id/items',         to: 'invoices#items'
      get '/invoices/:id/customer',      to: 'invoices#customer'
      get '/invoices/:id/merchant',      to: 'invoices#merchant'

      get '/invoice_items/:id/invoice',  to: 'invoice_items#invoice'
      get '/invoice_items/:id/item',     to: 'invoice_items#item'

      get '/items/:id/invoice_items',    to: 'items#invoice_items'
      get '/items/:id/merchant',         to: 'items#merchant'

      get '/transactions/:id/invoice',   to: 'transactions#invoice'

      get '/customers/:id/invoices',     to: 'customers#invoices'
      get '/customers/:id/transactions',  to: 'customers#transactions'

      get '/merchants/most_revenue?quantity=x', to: 'merchants#most_revenue'
      get '/merchants/most_items?quantity=x',   to: 'merchants#most_items'
      get '/merchants/revenue?date=x',          to: 'merchants#revenue'

      get '/merchants/:id/revenue',              to: 'merchants#total_revenue'
      get '/merchants/:id/revenue?date=x', to: 'merchants#invoice#revenue'
      get '/merchants/:id/favorite_customer', to: 'merchants#favorite_customer'
      get '/merchants/:id/pending_invoices', to: 'merchants#pending_invoices'

      get '/items/most_revenue?quantity=x', to: 'items#most_revenue'
      get '/items/most_items?quantity=x', to: 'items#most_items'
      get '/items/:id/best_day', to: 'items#best_day'

      get '/customers/:id/favorite_merchant', to: 'customers#favorite_merchant'

      get '/transactions', to: 'transactions#index'
    end
  end
end
