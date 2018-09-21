Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # TODO: ingredientsのresourcesをadminへ
  # get '/ingredients', to: 'ingredients#index'

  resources :users
  resources :ingredients
  resources :pantries, except: [:index]
end
