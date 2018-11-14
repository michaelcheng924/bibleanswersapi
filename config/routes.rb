Rails.application.routes.draw do
  resources :users
  resources :post_tags
  resources :tags
  resources :posts

  get '/homefetch', to: 'posts#homefetch'
  get '/relatedposts/:id', to: 'posts#related'
  get '/export', to: 'posts#export'

  get '/tags_for_all_posts', to: 'tags#tags_for_all_posts'
  get '/tags_for_unfinished', to: 'tags#tags_for_unfinished'

  get '/sitemap', to: 'sitemap#index'
  patch '/sitemap', to: 'sitemap#update'

  get '/initialfetch', to: 'application#initialfetch'

  post '/login', to: 'users#login'
  post '/checktoken', to: 'users#checktoken'
end
