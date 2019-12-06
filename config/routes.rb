Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: %i[show destroy] do
    member do
      get 'accept'
      get 'reject'
    end
  end

  resources :dashboards, only: :index

  resources :gardens, only: %i[new create show index] do
    resources :bookings, only: %i[create update]
  end
end
