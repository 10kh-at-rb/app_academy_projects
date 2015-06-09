Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resource :session, only: [ :create, :destroy ]
  resources :goals, only: [:create, :edit, :update, :destroy]
end
