Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :clothes
  resources :users
  # root 'application#welcome'
  get '/signup', to: 'users#new'
  get '/uploadclothes', to: 'clothes#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
