Rails.application.routes.draw do
  resources :clothes
  resources :users
  root 'application#welcome'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
