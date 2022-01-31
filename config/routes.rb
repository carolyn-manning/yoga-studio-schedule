Rails.application.routes.draw do

  resources :styles
  root 'static#home'

  get '/signup', to: 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout/', to: 'sessions#destroy'

  get '/schedule', to: 'yoga_classes#index'

  post '/add_class', to: 'user_classes#add_class'

  get '/auth/github/callback' => 'sessions#create'
  
  resources :studios
  
  resources :users do 
    resources :yoga_classes
  end 
  resources :teachers
  resources :yoga_classes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
