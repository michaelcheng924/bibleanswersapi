Rails.application.routes.draw do
  resources :staging_tags
  resources :tags
  resources :staging_posts
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
