Rails.application.routes.draw do
  devise_for :users
  root to: 'cases#index'
  resources :cases, only: [:index]
end
