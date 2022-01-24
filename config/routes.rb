Rails.application.routes.draw do

  get '/signup', to: 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout/', to: 'sessions#destroy'
  
  resources :studios
  resources :users
  resources :teachers
  resources :yoga_classes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
