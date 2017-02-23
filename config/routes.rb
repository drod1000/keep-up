Rails.application.routes.draw do
  root :to => "pages#show"
  #OAuth
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  resources :users, only: [:show] do
    resources :lists, only: [:index]
  end
end
