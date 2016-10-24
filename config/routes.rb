Rails.application.routes.draw do
  devise_for :admins

  get 'pages/home'

  root to: 'pages#home'
  resources :users do
    get 'pages/checkedin'
    get 'show'
  end
  
  resources :admins, only: [:show, :index] do
    resources :users, only: [:index]
  end

  get 'admin', :to => redirect('/admins/sign_in')

  resources :users, only: [:new, :edit, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
