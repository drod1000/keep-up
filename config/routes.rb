Rails.application.routes.draw do
  root :to => "pages#show"
  #OAuth
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show] do
    resources :lists, only: [:index, :show]
  end
  #API
  namespace :api do
    namespace :v1 do
      resources :lists, only: [:create]
    end
  end
end
