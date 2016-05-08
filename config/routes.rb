Rails.application.routes.draw do
  resource :sessions, only: [:show, :create, :destroy]
  root to: 'home#index'
end
