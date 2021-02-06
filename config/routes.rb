Rails.application.routes.draw do
  resources :posts
  resources :songs
  resources :poems
  resources :short_stories
  scope '/admin' do
    resources :admins, only: [:edit, :update, :show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  resources :short_stories, :poems, :songs, :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'
end
