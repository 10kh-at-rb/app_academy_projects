Rails.application.routes.draw do
  root to: 'static_pages#root'
  resources :posts, default: :json, only: [:create]

end
