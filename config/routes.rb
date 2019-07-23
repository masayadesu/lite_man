Rails.application.routes.draw do
  get 'literatures/index'
  resources :literatures
end
