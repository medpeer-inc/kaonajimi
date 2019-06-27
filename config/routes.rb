Rails.application.routes.draw do
  root to: 'top#index'

  get :login, to: 'user_sessions#new', as: 'login'
  get :logout, to: 'user_sessions#destroy', as: 'logout'

  resources :user_tags
  resources :users, only: %i(show edit update)
  resources :user_sessions, only: %i(create)
end
