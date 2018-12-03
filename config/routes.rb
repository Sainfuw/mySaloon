Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, path_prefix: 'auth'

  resources :booking_service, only: [:index, :new, :create]
  resources :dashboard, only: :index do
    collection do
      get 'get_bookings_per_day'
      get 'get_billings_per_day'
    end
  end
  resources :billings
  resources :bookings
  resources :services
  resources :customers
  resources :users

  root to: 'dashboard#index'
end
