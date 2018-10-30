Rails.application.routes.draw do
  resources :users
  resources :post_tags
  resources :tags
  resources :posts

  get '/initialfetch', to: 'posts#initialfetch'
  get '/admininfo', to: 'posts#admininfo'

  post '/login', to: 'users#login'
  post '/checktoken', to: 'users#checktoken'
end
