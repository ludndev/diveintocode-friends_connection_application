Rails.application.routes.draw do

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  root to: 'auth#welcome'

  get '/login', to: 'auth#login', as: 'auth_login'
  get '/logout', to: 'auth#logout', as: 'auth_logout'

end
