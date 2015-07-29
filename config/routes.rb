Rails.application.routes.draw do

  namespace :api do
  namespace :v1 do
    get 'items/random'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/show'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/find'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/find_all'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/invoice_items'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/merchant'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/most_revenue'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/most_items'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'items/best_day'
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
