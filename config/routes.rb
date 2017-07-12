Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # == devise routes
  # route format for customized controllers with devise functionality
  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users

  # == custom routes
  root to: "users#home"
  get "/feed" => "users#feed"

  # == RESTful routes
  resources :users do
      resources :boats
      resources :jobs
      resources :comments
  end
  resources :ports

end
