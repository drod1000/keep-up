Rails.application.routes.draw do
  root :to => "pages#show"
  #OAuth
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :users, only: [:show] do
    resources :lists, only: [:index, :show]
  end
  #API
  namespace :api do
    namespace :v1 do
      resources :lists, only: [:create]
      resources :articles, only: [:create] do
        post '/like', to: 'articles#like'
      end
    end
  end
end
