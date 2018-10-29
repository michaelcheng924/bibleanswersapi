Rails.application.routes.draw do
  resources :users
  resources :staging_post_tags
  resources :post_tags
  resources :staging_tags
  resources :tags
  resources :staging_posts
  resources :posts

  get '/initialfetch', to: 'posts#initialfetch'
  get '/initialfetchstaging', to: 'posts#initialfetchstaging'
  get '/admininfo', to: 'posts#admininfo'

  post '/login', to: 'users#login'
  post '/checktoken', to: 'users#checktoken'
end
