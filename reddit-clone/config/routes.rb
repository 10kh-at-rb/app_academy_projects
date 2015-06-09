Reddit::Application.routes.draw do
  root to: 'subs#index'
  resources :users
  resource :session, only: [:new, :destroy, :create]
  resources :subs, except: :destroy do
    resources :posts, only: :new
  end
  resources :posts, except: [:index, :destroy, :new] do
    resources :comments, only: :new
  end
  resources :comments, only: :create

end
