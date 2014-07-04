Rails.application.routes.draw do
  resources :microposts, only: [:index, :new, :show, :create]

  get 'users/new'

  root 'microposts#index'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'

  # resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'
end
