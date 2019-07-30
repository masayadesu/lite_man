Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # get "literatures/index"

  root 'home#index'

  # resources :users, only: %i[new create]
  resources :users do
    get "search", on: :collection
  end
  resources :literatures do
    get "search", on: :collection
  end
end
