Rails.application.routes.draw do
  resources :staging_post_tags
  resources :post_tags
  resources :staging_tags
  resources :tags
  resources :staging_posts
  resources :posts

  get '/initialfetch', to: 'posts#initialfetch'
  get '/initialfetchstaging', to: 'posts#initialfetchstaging'
  get '/admininfo', to: 'posts#admininfo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
