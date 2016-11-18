Rails.application.routes.draw do
  root to: 'requests#index'
  resources :requests, only: [:show, :index]
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :requests, only: [:create]
    end
  end
end
