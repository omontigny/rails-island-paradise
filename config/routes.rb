Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # new routes

  resources :islands, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  namespace :owner do
    resources :islands, only: [:index]
    resources :bookings, only: [:index] do
      member do
        patch :accept
        patch :refuse
      end
    end
  end
end
