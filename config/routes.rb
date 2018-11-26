Rails.application.routes.draw do
  # resources :comments
  # resources :votes
  # resources :project_tags
  # resources :tags
  # resources :projects
  namespace :api do
      namespace :v1 do
        resources :users, only: [:create]
        resources :projects, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
      end
    end
end