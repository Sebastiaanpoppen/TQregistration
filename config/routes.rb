Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/home'

  get 'pages/search_users'
  get '/search_users' => "pages#search_users"

  resources :users, only: [:new, :create, :edit, :show] do
    get 'pages/checkedin'
    get 'show'
  end

  devise_for :admins, :controllers => { :registrations => 'admins'}

  resources :admins do
    resources :bookings
    resources :users, only: [:index]
    get 'destroy_365days' => 'bookings#destroy_365days'
      devise_scope :admin do
        get '/superadmin', to: "admins#super_admin"
        delete '/destroy', to: "admins#destroy"
      end
  end

  devise_scope :admin do
    patch '/admins/toggle_active/:id', to: "admins#toggle_active"
    put '/admins/toggle_active/:id', to: "admins#toggle_active"
    patch '/admins/toggle_full_access/:id', to: "admins#toggle_full_access"
    put '/admins/toggle_full_access/:id', to: "admins#toggle_full_access"
  end

  get 'admin', :to => redirect('/admins/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
