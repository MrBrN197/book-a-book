Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users do
      resources :reservations 
    end
  end

  namespace :api, defaults: {format: :json} do
    resources :books 
  end

end
