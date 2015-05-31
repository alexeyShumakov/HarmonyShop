Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :users do
    resources :orders, shallow: true
  end



  get 'admin', to: 'admin/admin#index', as: :admin
  namespace :admin do

  end



  get 'delivery_price', to: 'orders#delivery_price', as: :delivery_price

  get 'my_orders', to: 'orders#my_orders', as: :my_orders

  get 'private_office', to: 'users#private_office', as: :private_office

  resources :size_helpers

  resources :services_groups

  resources :services

  resources :line_items

  get 'test_json', to: 'products#test_json'
  get 'cart', to: 'carts#custom_show', as: :cart_custom_show

  resources :products_colors_sizes

  resources :sizes

  resources :products_colors do
    resources :images
  end

  resources :colors

  resources :categories

  resources :products do
    resources :additional_descriptions, shallow: true
  end
  get '/search', to: 'products#search', as: :search

  root 'categories#index'

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
