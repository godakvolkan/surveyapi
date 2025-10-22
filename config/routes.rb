Rails.application.routes.draw do
  get 'api/info'
  # API Routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :surveys, only: [:index, :show, :create, :update, :destroy]
      resources :questions, only: [:index, :show, :create, :update, :destroy]
      resources :answers, only: [:index, :show, :create, :update, :destroy]
      resources :responses, only: [:index, :show, :create, :update, :destroy]
    end
    
    # API Info endpoint
    get '', to: 'api#info'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
