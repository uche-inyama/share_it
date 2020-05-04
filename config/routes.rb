Rails.application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :followings, only: %i[create destroy]
  resources :opinions, only: %i[index show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/opinion/foreign', to: 'opinions#foreign'
  # get '/follow/:id', to: 'users#follow'
  root 'sessions#new'
end
