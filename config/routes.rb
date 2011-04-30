SummitTraffic::Application.routes.draw do
  # Custom named routes
  get '/contact' => 'contact#index', :as => :contact
  get '/products' => 'products#index', :as => :products
  get '/sign_in' => 'sessions#new', :as => :sign_in
  get '/sign_out' => 'sessions#destroy', :as => :sign_out
  
  # Resources
  resources :articles, :users, :sessions
  
  # Root
  root :to => "home#index"
end
