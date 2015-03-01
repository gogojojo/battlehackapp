Rails.application.routes.draw do
  get '/' => 'application#index'
  resources :users
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
end

