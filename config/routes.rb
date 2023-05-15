Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root to: 'imagings#search'
  resources :imagings do
    collection do
      get 'search'
    end
    resources :conditions, only: [:new, :create, :show, :edit, :update, :destroy] do
      member do
        put 'toggle_checkbox'
      end
      collection do
        delete 'destroy_selected'
      end
    end
  end
  resources :users, only: :show
  resources :occupations, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :machines, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
