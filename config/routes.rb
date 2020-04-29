Rails.application.routes.draw do
  resources :users
  resources :opinions, only: %i[index show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/opinion/foreign', to: 'opinions#foreign'
  root 'sessions#new'
end
