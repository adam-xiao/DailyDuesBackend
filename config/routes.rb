Rails.application.routes.draw do
  resources :media
  resources :users

  post '/login', to: 'auth#login'

  get "/auto_login", to: "auth#auto_login"

  get "/getmedia", to: "users#selfMedia"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
