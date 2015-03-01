Rails.application.routes.draw do
  get 'orders/new'

  get '/' => 'application#index'
  resources :users
  resources :events
  resources :orders
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get 'event/:id' => 'events#addparticipants', as: :part
end

