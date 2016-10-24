Rails.application.routes.draw do
  get 'pages/home'

  root to: 'pages#home'
  resources :users do
    get 'pages/checkedin'
  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
