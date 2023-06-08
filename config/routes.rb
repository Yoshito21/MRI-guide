Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root to: 'imagings#index'
  resources :imagings do
    collection do
      match 'search', via: [:get, :post]
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
  resources :occupations do
    resources :machines, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :occupation_memberships, only: [:index, :new, :show, :create, :destroy] do
      member do
        patch 'accept'
        patch 'reject'
      end
    end
    collection do
      get :search
    end
  end
  post '/occupations/search', to: 'occupations#search'
  delete 'occupations/:id/leave', to: 'occupations#leave', as: :leave_occupation

  #resources :categories, only: [:index, :new, :create]
  #get '/category/:id', to: 'categories#search'
end
