Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :clothes
  resources :users
  # root 'application#welcome'
  get '/signup', to: 'users#new'
  get '/uploadclothes', to: 'clothes#new'
  get '/generate', to: 'users#generate'
  get '/generate_again', to: 'users#generate_again', as: :generate_again
  get '/closet', to: 'sessions#show'
  get '/laundry', to: 'users#laundry'
  patch '/ootd', to: 'users#ootd'
  patch '/wash', to: 'users#wash'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
