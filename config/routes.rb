Rails.application.routes.draw do
  root 'home#index'
  get "literatures/index"

  resources :literatures do
    get "search", on: :collection
  end
end
