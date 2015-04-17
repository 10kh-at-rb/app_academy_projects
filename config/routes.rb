Reddit::Application.routes.draw do
  root to: 'subs#index'
  resources :users
  resource :session, only: [:new, :destroy, :create]
  resources :subs, except: :destroy
  resources :posts, except: [:index, :destroy]

end
