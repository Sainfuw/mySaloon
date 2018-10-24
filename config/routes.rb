Rails.application.routes.draw do
  get 'booking_service/index'
  get 'booking_service/new'
  resources :dashboard, only: :index
  resources :bookings
  resources :services
  resources :customers
  devise_for :users
  root to: 'dashboard#index'
end
