Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # TODO: foodsのresourcesをadminへ
  # get '/foods', to: 'foods#index'

  resources :users
  resources :foods do
    collection do
      get 'history'
      post 'delete_history'
    end
  end
  resources :storages, except: [:index]
  resources :recipes do
    collection do
      get 'can_be_made'
      get 'a_little_more'
    end
    member do
      delete 'used_as_ingredient'
    end
  end
end
