Rails.application.routes.draw do
  root to: 'top#index'
  resources :user_tags, only: %i(index show create edit update destroy)
  resources :user_taggings
  resources :users, only: %i(show edit update)
end
