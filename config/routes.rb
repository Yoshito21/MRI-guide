Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root to: 'imagings#index'
  resources :imagings do
    collection do
      get 'search'
    end
  end
  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
