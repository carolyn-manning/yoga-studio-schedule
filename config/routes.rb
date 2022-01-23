Rails.application.routes.draw do
  resources :studios
  resources :users
  resources :teachers
  resources :yoga_classes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
