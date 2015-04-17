Reddit::Application.routes.draw do
  resources :users
  resource :session, only: [:new, :destroy, :create]

end
