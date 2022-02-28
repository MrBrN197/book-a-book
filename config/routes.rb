Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users do
      resources :reservations 
    end
  end

  namespace :api, defaults: {format: :json} do
    resources :books 
  end

  post '/login', to: 'api/users#login'
  post '/sign_up', to: 'api/users#sign_up'
  post '/token', to: 'api/users#token'

end
