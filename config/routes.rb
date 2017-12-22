Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  post '/products' => 'products#create'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  post '/users' => 'users#create'

  post '/carted_products' => 'carted_products#create'
  get '/carted_products' => 'carted_products#index'

  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'
end
