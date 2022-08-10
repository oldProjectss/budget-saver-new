Rails.application.routes.draw do
  devise_for :users

  root to: 'splash#index'
  get '/users/:id', to: 'groups#index', as: 'user_root'
  resources :groups do
    resources :conversions
    resources :group_conversions
  end
  resources :users
  # resources :conversions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
