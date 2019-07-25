Rails.application.routes.draw do
  get "literatures/index"

  resources :literatures do
    get "search", on: :collection
  end
end
