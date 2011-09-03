Politiq::Application.routes.draw do
  resources :stories

  devise_for :members, :controllers => { :registrations => "profiles" } do
    get "profiles/constituency", :to => 'profiles#constituency', :as => "constituency"
    post "profiles/constituency", :to => 'profiles#setconstituency'
    get 'profiles/:id', :to => 'profiles#profile', :as => 'profile'
    get 'profiles/getridings/:id', :to => 'profiles#getridings', :as => 'getridings'
  end 

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'control' => 'pages#control', :as => :control
  match 'role_control' => 'pages#setrole', :as => :role_control, :via => 'post'
  match 'restaurant' => 'pages#restaurant', :as => :restaurant
  match 'parliament' => 'pages#parliament', :as => :parliamententrance
      
  match 'caucus' => 'parties#caucus', :as => :caucus
      
  match 'open_parliament' => 'house_sessions#open', :as => :parliament, :via => 'post'
  match 'open_parliament' => 'house_sessions#prorogue', :as => :parliament, :via => 'put'
  match 'open_parliament' => 'house_sessions#dissolve', :as => :parliament, :via => 'delete'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :bills do
    member do
      put 'present'
      put 'confidence'
    end
    
    resources :provisions
  end
  
  resources :forums
  resources :motions
  
  resources :oral_questions
  
  resources :discussions do
    resources :messages
  end
  
  resources :ballots
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
  root :to => "stories#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
