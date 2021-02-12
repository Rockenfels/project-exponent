Rails.application.routes.draw do
  resources :short_stories, :poems, :songs, :posts

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#index"

  get "/about", to: "static#about"
  get "/contact", to: "static#contact"
end
