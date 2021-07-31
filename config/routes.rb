Rails.application.routes.draw do

  root to: 'auth#welcome'

  get '/login', to: 'auth#login', as: 'auth_login'
  get '/logout', to: 'auth#logout', as: 'auth_logout'

end
