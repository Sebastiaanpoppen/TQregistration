Rails.application.routes.draw do
  devise_for :admins
  get 'pages/home'

  root to: 'pages#home'
  resources :users do
    get 'pages/checkedin'
    get 'show'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
