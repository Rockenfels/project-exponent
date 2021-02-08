Rails.application.routes.draw do
  resources :posts
  resources :songs
  resources :poems
  resources :short_stories

  resources :sessions, only: [:new, :create, :destroy]
  

  resources :short_stories, :poems, :songs, :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'
end
