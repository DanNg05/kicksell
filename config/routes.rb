Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "my_orders", to: "shoes#my_orders", as: :my_orders
  get 'users/:user_id/orders', to: "shoes#my_orders", as: 'user_orders'
  get "favourites", to: "shoes#favourites", as: :favourites
  resources :shoes do
    resources :orders, only: [:new, :create, :destroy]
    resources :favourites, only: [:new, :create, :destroy]
    collection do
      get :casual
      get :luxury
      get :formal
    end
  end

  resources :orders do
    resources :reviews, only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "posts#index"
  # get "about", to: "pages#about"

end
