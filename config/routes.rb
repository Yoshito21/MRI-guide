Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  devise_scope :user do
    get 'occupations', to: 'users/registrations#new_occupation'
    post 'occupations', to: 'users/registrations#create_occupation'
  end
  root to: 'imagings#search'
  resources :imagings do
    collection do
      get 'search'
    end
    resources :conditions, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  resources :users, only: :show
  resources :occupations, only: [:new, :create, :show]
  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
