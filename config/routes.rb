Rails.application.routes.draw do
  resources :dashboard, only: :index
  resources :bookings
  resources :services
  resources :customers
  devise_for :users
  root to: 'dashboard#index'
end
