Rails.application.routes.draw do

  root 'static#home'

  get '/signup', to: 'users#new'
  resources :users, only: [:show, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout/', to: 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'

  get '/schedule', to: 'yoga_classes#index'
  resources :yoga_classes do
    resources :users, only: [:index]
  end

  post '/add_class', to: 'user_classes#add_class'
  post '/remove_class', to: 'user_classes#destroy'

  resources :teachers, only: [:show, :new, :create, :edit, :update, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
