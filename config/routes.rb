Rails.application.routes.draw do
  resources :users
  resources :teams do 
    resources :wrestlers
  end
  resources :wrestlers

  get '/wrestlers', to: 'wrestlers#new'
  post '/wrestlers', to: 'wrestlers#show'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/most_recent', to: 'wrestlers#most_recent', as: 'recent'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
