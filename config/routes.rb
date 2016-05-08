Rails.application.routes.draw do
  resource :sessions, only: [:show, :create, :destroy]
  resources :votes, only: [:index, :create]
  root to: 'home#index'
end
