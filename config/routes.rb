Rails.application.routes.draw do

  root 'welcome#home'
  get '/signin' => 'sessions#new'
  get '/users/logout' => 'sessions#destroy'
  post '/users/:id' => 'rides#create'
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:create]
  resources :attractions
end
