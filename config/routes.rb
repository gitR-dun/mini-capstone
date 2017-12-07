Rails.application.routes.draw do
  get '/all_products' => 'products#the_products'
  get '/the_product' => 'products#one_product'
  get '/second_product' => 'products#two_product'
  get '/show-the-product' => 'products#show'
  get '/one-of-the-products/:id' => 'products#segment'
end
