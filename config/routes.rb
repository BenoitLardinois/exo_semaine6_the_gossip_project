Rails.application.routes.draw do
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/profile', to: 'static_pages#profile'
  get 'static_pages/:user_name', to: 'static_pages#show'
  get 'static_pages/dashborad', to: 'static_pages#dashbord'
  
  
  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
