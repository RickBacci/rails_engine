Rails.application.routes.draw do

  namespace :api do
  namespace :v1 do
    get 'customers/random'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/show'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/find'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/find_all'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/invoices'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/transactions'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'customers/favorite_merchant'
    end
  end

  namespace :api do
    namespace :v1, defaults: { format: :json } do


      objects = [:merchants, :invoices, :items, :invoice_items, :customers]

      objects.each do |object|
        get "/#{object}/random",   to: "#{object}#random"
        get "/#{object}/:id",      to: "#{object}#show"
        get "/#{object}/find_all", to: "#{object}#find_all"
        get "/#{object}/find",     to: "#{object}#find"
      end


      get '/merchants/:id/items', to: 'merchants#items'
      get '/merchants/:id/invoices', to: 'merchants#invoices'

    end
  end
end
