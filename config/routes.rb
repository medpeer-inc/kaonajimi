Rails.application.routes.draw do
  root to: 'top#index'

  get :login, to: 'user_sessions#new', as: 'login'
  get :logout, to: 'user_sessions#destroy', as: 'logout'

  resources :user_tags, only: %i(index show create edit update destroy)
  resources :user_taggings
  resources :users, only: %i(index show edit update)
  resources :user_images, only: %i(create destroy)
  resources :user_sessions, only: %i(create)
end
