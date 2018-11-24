Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, path_prefix: 'auth'

  resources :booking_service, only: [:index, :new, :create]
  resources :dashboard, only: :index
  resources :bookings
  resources :services
  resources :customers
  resources :users

  root to: 'dashboard#index'
end
