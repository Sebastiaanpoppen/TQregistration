Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/home'

  root to: 'pages#home'
  get 'pages/search_users'
  get '/search_users' => "pages#search_users"

  resources :users, only: [:new, :create, :edit, :show] do
    get 'pages/checkedin'
    get 'show'
  end

  get 'admin', :to => redirect('/admins/sign_in')
    devise_scope :admin do
      get 'admins/superadmin', to: "admins#super_admin"
    end

  resources :admins, only: [:index] do
    resources :bookings
    resources :users, only: [:index]
    get 'destroy_365days' => 'bookings#destroy_365days'
  end

  devise_for :admins, :controllers => { :registrations => 'admins'}



  get 'admin', :to => redirect('/admins/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
