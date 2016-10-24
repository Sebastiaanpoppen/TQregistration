Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/checkedin'
  root to: 'pages#home'
  resources :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
