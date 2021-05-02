Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :wrestlers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
