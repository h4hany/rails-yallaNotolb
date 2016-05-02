Rails.application.routes.draw do

  resources :menus 
  resources :friends
  resources :group_users
  resources :order_details
  resources :notifications
  resources :ordrs
  resources :groups
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'user/getId' => 'user#getUserId'
  get 'home/show' => 'home#show'
  get 'order_details/notification/:id' => 'order_details#notification'

  get 'order_details/addajax' => 'order_details#addajax'
  get 'user/getFriendId' => 'user#getFriendId'
  get 'group/getUsers' => 'groups#getUsers'


  get 'notifications/:id' => 'notifications#all_notification'

  #sockets_for :notifications , only: [:show]
  
  sockets_for :users do
    sockets_for :notifications
  end




 resources :friends
match 'friends/newfriend' => 'friends#newfriend', :via => :post
 resources :friends do
    member do
      get :friend
      get :unfriend
    end
 end

  #get 'notifications/:id/clear' , to: 'notifications#all_notification'

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
