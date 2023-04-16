Rails.application.routes.draw do
  devise_for :users
  resources :case do
    collection do
      get 'search'
    end
  end
  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
