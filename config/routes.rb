Rails.application.routes.draw do
  root to: 'top#index'
  resources :user_tags
  resources :users, only: %i(show edit update)
end
