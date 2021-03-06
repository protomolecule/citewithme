Cwm::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "sauces#index"
  match "cites/search" => 'cites#hashtagindex'
  match "sauces/show/:id" => 'sauces#show_only'
  match "sauces/show_search" => 'sauces#show_only_search'
  match "createcites" => "cites#createcites"
  match "htags" => "htags#index"
  match "cites/create_file_by_sauce" => 'cites#create_file_by_sauce'
  match "cites/create_file_by_hashtag" => 'cites#create_file_by_hashtag'  
  match "cites/create_file_by_hashtag_and_sauce" => 'cites#create_file_by_hashtag_and_sauce'
  match "sauces/import_google_books" => 'sauces#import_google_books'  
  match "sauces/create_from_google" => 'sauces#create_from_google'  
  match "about" => 'application#about'
  match "evernote_export" => 'evernote#evernote_export'
  resources :sauces
  resources :cites
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
