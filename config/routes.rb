Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # TODO: foodsのresourcesをadminへ
  # get '/foods', to: 'foods#index'

  resources :users
  resources :foods
  resources :storages, except: [:index]
  resources :recipes
end
