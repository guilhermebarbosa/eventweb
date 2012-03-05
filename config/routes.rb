Events::Application.routes.draw do

  match 'events/:event_id/categories/public' => 'categories#public'
  match 'events/:event_id/public_event' => 'events#public_event'
  match 'events/public' => 'events#public'
  match 'event_types/public' => 'event_types#public'
  match 'events/:event_id/establishments/public' => 'establishments#public'
  match 'events/:event_id/establishment_types/public' => 'establishment_types#public'
  match 'events/:event_id/lectures/public' => 'lectures#public'
  match 'events/:event_id/places/public' => 'places#public'
  match 'events/:event_id/speakers/public' => 'speakers#public'
  match 'events/:event_id/galleries/public' => 'galleries#public'
  match 'events/:event_id/sponsors/public' => 'sponsors#public'
  match 'events/:event_id/sponsor_types/public' => 'sponsor_types#public'
  
  match 'events/:event_id/lectures/insert_category_select/:name' => 'lectures#insert_category_select'
  match 'events/:event_id/lectures/insert_place_select/:name' => 'lectures#insert_place_select'
  match 'events/:event_id/sponsors/insert_sponsor_type_select/:name' => 'sponsors#insert_sponsor_type_select'
  
  match 'events/:event_id/lectures/:lecture_id/insert_category_select/:name' => 'lectures#insert_category_select'
  match 'events/:event_id/lectures/:lecture_id/insert_place_select/:name' => 'lectures#insert_place_select'
  match 'events/:event_id/sponsors/:sponsor_id/insert_sponsor_type_select/:name' => 'sponsors#insert_sponsor_type_select'

  resources :establishment_types

  resources :establishments

  resources :galleries

  resources :event_types

  resources :users

  get "user_sessions/new"

  resources :places

  resources :categories

  resources :sponsor_types

  resources :sponsors

  resources :lectures

  resources :speakers

  resources :events

  resources :home

  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #  match 'products/:id' => 'catalog#view'
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
    resources :events do
      resources :lectures
      resources :categories
      resources :places
      resources :speakers
      resources :sponsors
      resources :establishments
      resources :establishment_types
      resources :sponsor_types
      resources :galleries
    end

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
  root :to => "events#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
