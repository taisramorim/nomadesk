Rails.application.routes.draw do
  get 'searches/index'
  devise_for :users
  root to: "coworkings#index"
  # root to: "rents#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :searches, only: %i[index]
  resources :coworkings, only: %i[show new create edit update destroy] do
    resources :rents, only: %i[new create show] do
      member do
        post 'accept'
        post 'reject'
      end
    end
  end
  resources :rents, only: %i[destroy edit update]

  get "profile", to: "users#profile"
end
