Rails.application.routes.draw do
  resources :customers
  resources :orders
  resources :orderdetails
  resources :contacts

  get '/search' => 'pages#search', :as => 'search_page'
  resources :articles
  resources :contact
  resources :products
  root "home#index"
  resources :products, only: [:index]
  root to: "products#index"
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
