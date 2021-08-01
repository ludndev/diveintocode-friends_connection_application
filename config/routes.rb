Rails.application.routes.draw do

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  root to: 'auth#welcome'

  get '/signup', to: 'auth#signup', as: 'auth_signup'
  post '/signup', to: 'auth#post_signup', as: 'auth_post_signup'
  get '/login', to: 'auth#login', as: 'auth_login'
  post '/login', to: 'auth#post_login', as: 'auth_post_login'
  get '/logout', to: 'auth#logout', as: 'auth_logout'
  get '/profile', to: 'auth#profile', as: 'auth_profile'

end
