Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # == devise - route format for customized controllers with devise functionality
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }

  # == custom routes
  root to: "users#home"
  # root to: "admins#home"
  get "/feed" => "users#feed"
  get "/comment_ujs" => "jobs#comment_ujs"

  # == RESTful routes
  resources :users do
      resources :boats
      resources :jobs
      resources :comments
  end
  resources :ports
  resources :admins

end
