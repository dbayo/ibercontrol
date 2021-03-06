Rails.application.routes.draw do
  resources :default_products do
    member do
      delete 'remove_product/:product_id' => 'default_products#remove_product'
      post 'add_product'
    end
  end

  resources :products

  resources :employees

  resources :activities

  resources :plagues

  resources :service_types

  resources :clients do
    resources :places do
      resources :services do
        resources :service_dates do
          member do
            delete 'remove_product/:product_id' => 'service_dates#remove_product'
            post 'add_product'
          end
        end
        member do
          get 'generate_dit'
          get 'generate_next_bills'
          get 'generate_next_service_dates'
        end
      end
      collection do
        get :fill_as_client
      end
    end

    resources :bills
  end

  root 'clients#index'
  get 'places' => 'places#index'
  get 'services_date/current_month' => 'service_dates#current_month'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
