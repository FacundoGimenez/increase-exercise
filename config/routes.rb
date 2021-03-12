require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :clients, only: [:show] do
        resources :transactions, only: [:index]
        get :received_payments, on: :member
        get :pending_payments, on: :member
      end
    end
  end
end
