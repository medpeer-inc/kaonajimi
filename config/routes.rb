Rails.application.routes.draw do
  resources :user_tags
  resources :users, only: %i(show edit update)
end
