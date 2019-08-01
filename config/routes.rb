Rails.application.routes.draw do
  # get 'mypage', to: 'users#me'
  get 'mypage', to: 'users#show'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  #
  root 'home#index'
  # root 'home#top'

  resource :account, only: %i[show edit update]
  resources :users do
    get "search", on: :collection
  end
  resources :literatures do
    get "search", on: :collection
  end
end
