Rails.application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :followings, only: %i[create destroy]
  resources :opinions, only: %i[index show]
  # get '/signup', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  post '/opinion/foreign', to: 'opinions#foreign'
  root 'users#new'
end
