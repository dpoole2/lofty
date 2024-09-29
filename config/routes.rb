Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create]

  root "users#index"
end
