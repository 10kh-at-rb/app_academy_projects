Reddit::Application.routes.draw do
  resources :users
  resource :session, only: [:new, :destroy, :create]
  resources :subs, except: :destroy
  resources :posts, except: [:index, :destroy]

end
