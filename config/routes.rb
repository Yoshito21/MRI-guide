Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root to: 'imagings#search'
  resources :imagings do
    collection do
      get 'search'
    end
    resources :conditions, only: [:new, :create, :show]
  end
  resources :users, only: :show
  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
