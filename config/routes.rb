Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :wrestlers

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'session#create'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
