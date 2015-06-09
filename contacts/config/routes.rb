Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    get 'favorite', on: :member
    get 'groups', on: :member
  end
  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]



  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/:id' => 'users#show'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

end
