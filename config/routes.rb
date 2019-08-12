Rails.application.routes.draw do
  # get 'mypage', to: 'users#me'
  # get 'mypage', to: 'users#show'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'about', to: 'home#about'
  # root 'home#index'
  root 'home#top'

  resource :account, only: %i[show edit update destroy]
  resource :password, only: %i[show edit update]
  #

  # resources :users do
  #   get "search", on: :collection
  # end

  # resources :users
  resources :users, only: %i[ new create]
  resources :literatures do
    # get "search", on: :collection
    # get "change_number"
    collection do
      get "search"
      get "per_page"
      # get 'csv_output'
    end
  end
  namespace :admin do
    # root to: "top#index"
    resources :users do
      get "search", on: :collection
    end
  end
end
