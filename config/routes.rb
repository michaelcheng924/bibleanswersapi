Rails.application.routes.draw do
  resources :users
  resources :post_tags
  resources :tags
  resources :posts

  get '/homefetch', to: 'posts#homefetch'
  get '/relatedposts/:id', to: 'posts#related'

  get '/sitemap', to: 'sitemap#index'
  patch '/sitemap', to: 'sitemap#update'

  get '/initialfetch', to: 'application#initialfetch'

  post '/login', to: 'users#login'
  post '/checktoken', to: 'users#checktoken'
end
