Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins

  get 'pages/home'

  root to: 'pages#home'
  get 'pages/search_users'

  resources :users, only: [:new, :create, :edit, :show] do
    get 'pages/checkedin'
    get 'show'
  end

  get 'admin', :to => redirect('/admins/sign_in')

  resources :admins do
    resources :bookings, only: [:create, :show, :index, :delete, :edit]
  end

  resources :admins, only: [:show, :index] do
    resources :users, only: [:index]
  end

  get 'admin', :to => redirect('/admins/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
